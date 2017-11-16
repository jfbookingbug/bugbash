require 'rubygems'
require 'sinatra'
require 'sinatra/formkeeper'
require 'pry'
require_relative 'helpers'

get '/' do
  erb :index
end


post '/' do
  @params = params

  inputs = [@params['email'], @params['activity']]

  if !params["name"].to_s.include?('@')
    params["name"] = 'That is not an email address!'
  end

  if any_empty?(inputs)
    params["name"] = 'You need to enter both fields'
  end

  if input_includes_naughty?
    params["name"] = 'NAUGHTTTTYYYY'
  end

  erb :index

#"My name is #{params[:name]}, and I love #{params[:favorite_food]}"
end
