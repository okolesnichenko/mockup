class Repository
  def initialize(redis)
    @redis = redis
  end

  def get
    keys = @redis.keys('*')
    if keys.empty?
      raise Sinatra::NotFound
    end
    response_array = @redis.mget(keys)
    JSON.parse response_array.to_json
  end

  def post(body)
    unless body['method'] && body['path'] && body['status'] && body['payload']
      return {'message': 'Can not create mock entity.'}
    end
    path = JSON.parse(body)['path']
    @redis.set path, body
  end

  def delete(path)
    req = @redis.del path
    if req == 0
      raise Sinatra::NotFound
    else
      'ok'
    end
  end

  def check(path, method)

    unless @redis.keys("*").include? path
      raise Sinatra::NotFound
    end
    response = JSON.parse(@redis.get path)
    unless response && response["method"].downcase == method.downcase
      raise Sinatra::NotFound
    end
    case method.downcase
    when 'get'
      {'payload':response['payload']}.to_json
    when 'post'
      {'status':response["status"]}.to_json
    when 'put'
      {'status':response["status"]}.to_json
    when 'delete'
      {'status':response["status"]}.to_json
    else
      {'status':response["status"], 'payload':response['payload']}.to_json
    end
  end

end