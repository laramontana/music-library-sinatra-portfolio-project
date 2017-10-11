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
      flash[:message] = "Please login to the song page."
      redirect '/login'
    end
  end

  get '/songs/:slug/edit' do
    if logged_in?
      @song = Song.find_by_slug(params[:slug])
      if @song.user == current_user
        erb :'/songs/edit_song'
      else
        flash[:message] = "You cannot change another user's song."
        redirect to "/songs/#{@song.slug}"
      end
    else
      flash[:message] = "Please login to see a song page."
      redirect to "/login"
    end
  end

  patch '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:artist].empty? && !params[:song][:name].empty?
      if artist ||= Artist.find_by(name: params[:song][:artist])
        @song.update(name: params[:song][:name], artist: artist)
      else artist = Artist.create(name: params[:song][:artist], user_id: current_user.id)
        @song.update(name: params[:song][:name], artist: artist)
      end
      flash[:message] = "You've successfully updated the song."
      redirect to "/songs/#{@song.slug}"
    else
        flash[:message] = "Please complete the form. Both fields must be filled in."
        redirect to "/songs/#{@song.slug}/edit"
    end
  end

  get '/songs/:slug/delete' do
    if logged_in?
      @song = Song.find_by_slug(params[:slug])
      if @song.user == current_user
        @song.destroy

        flash[:message] = "You've successfully deleted the song."
        redirect "/songs"
      else
        flash[:message] = "You cannot delete another user's song."
        redirect to "/songs/#{@song.slug}"
      end
    else
      flash[:message] = "Please login to see a song page."
      redirect to "/login"
    end
  end

end
