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
    if logged_in?
      session.clear
      erb :signup
    else
      erb :signup
    end
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:message] = @user.errors.full_messages.join('. ')
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      flash[:message] = "You are already logged in."
      redirect '/'
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:message] = "Invalid username or/and password. Please try again."
      redirect '/login'
    end
  end

  post '/logout' do
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

  private

    def authenticate_user #-> Possible message arg*
      if !logged_in?
        flash[:message] = "You must be logged in to access this page"
        redirect '/login'
      end
    end

end
