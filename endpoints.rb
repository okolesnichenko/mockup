require 'sinatra'

get "/*" do |path|
  path
end

get "/*/:id" do |path|
  path
end

post "/*" do |path|
  path
end

put "/*/:id" do |path|
  path
end

