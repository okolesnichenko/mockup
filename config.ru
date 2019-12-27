require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :test)

require './app/endpoints'
run Endpoints