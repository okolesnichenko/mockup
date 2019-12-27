require 'sinatra'
require 'sinatra/base'
require 'redis'
require 'json'
require 'dotenv/load'
require_relative './repository'

class Endpoints < Sinatra::Base
  before do
    content_type 'application/json'
  end

  not_found do
    {'status': 404}.to_json
  end

  redis = Redis.new(host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'])
  repository = Repository.new(redis)

  # Endpoints methods

  get "/endpoints" do
    repository.get
  end

  post "/endpoints" do
    repository.post(request.body.read)
  end

  delete "/endpoints/:path" do |path|
    repository.delete(path)
  end

  get "/timeout/:timeout" do
    count = params[:timeout].to_i
    count.times do
      sleep 1
    end
    {'message': "Processed #{count} items."}.to_json
  end

  # Methods for entities request

  get "/:path" do |path|
    repository.check(path, request.request_method.downcase)
  end
  post "/*" do |path|
    repository.check(path, request.request_method.downcase)
  end
  put "/*" do |path|
    repository.check(path, request.request_method.downcase)
  end
  delete "/*" do |path|
    repository.check(path, request.request_method.downcase)
  end

end
