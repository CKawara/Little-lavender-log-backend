require 'sinatra'
require_relative './config/environment'

class App < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    User.create(name: "activerecord api")
    users = User.all
    users.to_json
  end
  
end

run App
