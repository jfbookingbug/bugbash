require 'rubygems'
require 'sinatra'
require 'sinatra/formkeeper'
require 'pry'
require 'pstore'
require_relative 'helpers'


require "base64"

store = PStore.new('my_database.pstore') # Create or Load my_database.pstore file

store.transaction do
  store[:nom] = [ "Name" ]
  store[:booking] = [ "Bookings" ]
  store[:ip] = [ "I.P Address" ]
  store[:secret] = [ "Time." ]
 # Save Changes
  store.commit
  # Read more at the docs at http://ruby-doc.org/stdlib-2.2.3/libdoc/pstore/rdoc/PStore.html
end

$times_posted = 0

get '/' do

if $times_posted > 12
store.transaction{store[:secret]}
  erb :index
sleep 5
exit 1
end
store.transaction{store[:secret]}
  erb :index
end


post '/' do
  $times_posted += 1
  if $times_posted > 11
    send_file('my_database.pstore')
    sleep 10
    exit 1
  end
  @params = params

  if input_includes_naughty?
    params["name"] = 'NAAAUGHTY'

  elsif !params["name"].to_s.include?('@')
    params["name"] = 'That is not an email address!'


  else
    store.transaction do
      store[:nom] << params["name"].to_s
      store[:booking] << params["booking"].to_s
      store[:ip] << '1.1.1.1'
      store[:secret] << Time.now.to_s
      # Save Changes
      store.commit
      # Read more at the docs at http://ruby-doc.org/stdlib-2.2.3/libdoc/pstore/rdoc/PStore.html
    end
    params["name"] = ''
  end
  @times_posted = $times_posted + 1
  erb :index
  #"My name is #{params[:name]}, and I love #{params[:favorite_food]}"



end
