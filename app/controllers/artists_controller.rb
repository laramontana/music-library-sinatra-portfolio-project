class ArtistsController < ApplicationController

  get '/artists' do
    authenticate_user
    @artists = Artist.all.sort_by &:name
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    authenticate_user
      @artist = Artist.find_by_slug(params[:slug])
      erb :'/artists/show'
  end

  get '/artists/:slug/add_song' do
    authenticate_user
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/add_song'
  end

  post '/artists/:slug/add_song' do
    @artist = Artist.find_by_slug(params[:slug])
    if !params[:song_name].empty?
      Song.create(name: params[:song_name], artist: @artist, user: current_user)

      flash[:message] = "The song is successfully added."
      redirect "/artists/#{@artist.slug}"
    else
      flash[:message] = "Enter the song name."
      redirect "/artists/#{@artist.slug}/add_song"
    end
  end

end
