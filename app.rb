require 'sinatra'
require_relative 'isbnclass.rb'

get '/' do 
	erb :get_name
end

post '/name' do
	name = params[:user_name]
	redirect '/isbn?users_name=' + name
end

get '/isbn' do
	name = params[:users_name].capitalize
	erb :get_isbn, :locals => {:name => name}
end

post '/isbn' do
	name = params[:user_name].capitalize
	isbn = params[:isbn]
	results = valid_isbn?(isbn)
    if results == true
        results1 = "valid"
        "Thanks, #{name}, your ISBN, #{isbn}, is #{results1}!"
        else
        results1 = "invalid. Please try again"
        "Sorry, #{name}, your ISBN, #{isbn}, is #{results1}!"
        #redirect '/'
    end
    
	
end




