class Repository
  def initialize(redis)
    @redis = redis
  end

  def get
    response_array = @redis.mget(@redis.keys('*'))
    JSON.parse response_array.to_json
  end

  def post(body)
    unless body['method'] && body['path'] && body['status'] && body['payload']
      return {'message': 'Can not create mock entity.'}
    end
    @redis.set body['path'], body
  end

end