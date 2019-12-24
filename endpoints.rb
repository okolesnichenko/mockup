require 'sinatra'
require 'sinatra/base'
require 'redis'
require 'json'

class Endpoints < Sinatra::Base
  require_relative 'repository'

  before do
    content_type 'application/json'
  end

  not_found do
    {'status': 404}.to_json
  end

  redis = Redis.new(:host => '127.0.0.1', :port => '6380')
  repository = Repository.new(redis)

  get "/endpoints" do
    repository.get
  end

  post "/endpoints" do
    repository.post(request.body.read)
  end

  delete "/endpoints/:path" do |path|
    repository.delete(path)
  end

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
