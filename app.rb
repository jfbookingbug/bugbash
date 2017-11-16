require 'rubygems'
require 'sinatra'
require 'sinatra/formkeeper'
require 'pry'

get '/' do
  erb :index
end


post '/' do
@params = params
unless params["name"].to_s.include?('@')
params["name"] = 'That is not an email address!'
end
erb :index
#"My name is #{params[:name]}, and I love #{params[:favorite_food]}"
end
