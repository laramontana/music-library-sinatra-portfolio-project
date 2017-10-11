class SongsController < ApplicationController

  get '/songs' do
    if logged_in?
      @songs = Song.all.sort_by &:name
      erb :'/songs/index'
    else
      flash[:message] = "Please login to see all songs."
      redirect '/login'
    end
  end

  get '/songs/:slug' do
    if logged_in?
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
    else
      flash[:message] = "Please login to see all songs."
      redirect '/login'
    end
  end

  get '/songs/:slug/edit' do
    if logged_in?
      @song = Song.find_by_slug(params[:slug])
      if @song.user == current_user
        erb :'/songs/edit_song'
      else
        flash[:message] = "You can change only songs you've added."
        redirect to "/songs/#{@song.slug}"
      end
    else
      flash[:message] = "Please login to see a song page."
      redirect to "/login"
    end
  end

end
