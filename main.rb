require 'pry'
require 'sinatra'
# require 'sinatra/reloader'
require_relative "db_config"
require_relative 'models/donate'
require_relative 'models/request'
require_relative 'models/user'

enable :sessions

get '/' do
  @requests = Request.all
  
  erb :index

end

get '/login' do
	@redirect_to_id = session[:redirect_to_id]

	erb :login
end

get '/request/new' do
	@check=Donate.find_by(donator:session[:user_name])
  	erb :request
end

get '/request/:id' do
 	@info=Request.find(params[:id])

	if !session[:user_id]
		session[:redirect_to_id] = params[:id]
		redirect '/login'
	end

	erb :donate

end

post '/donations' do
	request=Request.find(params[:id])
	@donate=Donate.new
	@donate.donator=session[:user_name]
	@donate.request_id=request.id
	@donate.donate_amt=params[:amount]
	@donate.save

	redirect'/' 
end


post '/session' do
	user=User.find_by(email: params[:email])
	if 
	user && user.authenticate(params[:password])
	session[:user_id]=user.id

	session[:user_name]=user.name

		if session[:redirect_to_id]
		redirect "/request/#{session[:redirect_to_id]}"
		else
			redirect '/'
		end


    else

    	erb :login
	end
	
end

delete '/session' do

	session[:user_id]=nil
	session[:user_name]=nil


	redirect '/'
end

post '/signups' do
	user=User.new
	user.email=params[:email]
	user.password=params[:password]
	user.name=params[:name]
	user.save
	session[:user_name]=user.name

	if session[:redirect_to_id]

	redirect "/request/#{session[:redirect_to_id]}"
	else
			redirect '/'
	end
end


post '/requests' do 
    request=Request.new
	request.acceptor=session[:user_name]
	request.acpt_pic=params[:pic]
	request.acpt_story=params[:story]
	request.item=params[:item]
	request.amount=params[:amount]
	request.save

	redirect '/profile'
end
put "edit/:id" do
	@request=Request.find(params[:id])

	end

delete 'request/:id' do
	request=Request.find(params[:id]).destroy
	request.save
	redirect '/profile'
	end

get '/profile' do
	@requested=Request.where(acceptor:session[:user_name])
	@donated=Donate.where(donator:session[:user])
	erb :profile
end

