class Generator
  def initialize(path, model, method)
    @path = path
    @model = model
    @method = method
  end

  def get
    # get - models from db
  end

  def post
    # post - add model to db
    # if path exit -> add data to model
    # if path not exist -> make migration
  end

  def put
    # put - update model in db
  end

  def destroy
    # destroy - delete model in db
  end
end