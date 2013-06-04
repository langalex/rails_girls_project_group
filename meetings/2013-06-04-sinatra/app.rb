# see http://www.sinatrarb.com/intro.html
# gem install sinatra shotgun
# $: cd 2013-06-04-sinatra
# $: shotgun
require 'sinatra'

# get /hello
get '/hello' do
  "Hello World!"
end

# get /sum?one=1&two=4
get '/sum' do
  sum = params[:one].to_f + params[:two].to_f
  "The sum of #{params[:one]} and #{params[:two]} is #{sum}"
end

get '/html' do
  @name = params[:name]
  erb :hello
end

get '/form' do
  erb :form
end
