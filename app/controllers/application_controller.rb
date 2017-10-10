require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'music'
  end

  get "/" do
    if logged_in?
      @user = current_user
      erb :'/users/index'
    else
      erb :index
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(params[:user])
    session[:user_id] = @user.id

    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:password])
      redirect '/'
    else
      flash[:message] = "Invalid username or/and password. Please try again."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
