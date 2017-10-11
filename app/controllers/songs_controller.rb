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
    @song = Song.find_by_slug(params[:slug])
  end

end
