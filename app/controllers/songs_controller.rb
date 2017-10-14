class SongsController < ApplicationController

  get '/songs' do
    authenticate_user
    @songs = Song.all.sort_by &:name
    erb :'/songs/index'
  end

  get '/songs/new' do
    authenticate_user
    @artists = Artist.all
    erb :'/songs/create_song'
  end

  post '/songs/new' do
    authenticate_user
    params[:song][:artist] = params[:song][:selected_artist] if !params[:song][:selected_artist].empty?
    if !params[:song][:name].empty? && !params[:song][:artist].empty?
      artist = Artist.find_or_create_by(name: params[:song][:artist])
      @song = Song.create(name: params[:song][:name], artist: artist, user_id: current_user.id)

      flash[:message] = "The song is successfully added."
      redirect "/songs/#{@song.slug}"
    else
      flash[:message] = "Both fields must be filled in. Please complete the form."
      redirect '/songs/new'
    end
  end

  get '/songs/:slug' do
    authenticate_user
    @song = Song.find_by_slug(params[:slug])
    if @song
      erb :'/songs/show'
    else
      flash[:message] = "This song does not exist"
      redirect '/songs'
    end
  end

  get '/songs/:slug/edit' do
    authenticate_user
    @song = Song.find_by_slug(params[:slug]) #-> Instance of the song || nil
    if @song && @song.user == current_user
      erb :'/songs/edit_song'
    elsif @song && !@song.user == current_user
      flash[:message] = "You cannot change another user's song."
      redirect to "/songs/#{@song.slug}"
    else
      flash[:message] = "This song doesn't exist."
      redirect to "/songs"
    end
  end

  patch '/songs/:slug/edit' do
    authenticate_user
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:artist].empty? && !params[:song][:name].empty?
      if artist ||= Artist.find_by(name: params[:song][:artist])
        @song.update(name: params[:song][:name], artist: artist)
      else artist = Artist.create(name: params[:song][:artist], user_id: current_user.id)
        @song.update(name: params[:song][:name], artist: artist)
      end
      flash[:message] = "The song is successfully updated."
      redirect to "/songs/#{@song.slug}"
    else
      flash[:message] = "Both fields must be filled in. Please complete the form."
      redirect to "/songs/#{@song.slug}/edit"
    end
  end

  get '/songs/:slug/delete' do
    authenticate_user
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    if @song.user == current_user
      @song.destroy

      flash[:message] = "The song is successfully deleted."
      redirect "/artists/#{@artist.slug}"
    else
      flash[:message] = "You cannot delete another user's song."
      redirect to "/songs/#{@song.slug}"
    end
  end
end
