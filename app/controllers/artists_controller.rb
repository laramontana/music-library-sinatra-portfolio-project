class ArtistsController < ApplicationController

  get '/artists' do
    if logged_in?
      @artists = Artist.all.sort_by &:name
      erb :'/artists/index'
    else
      flash[:message] = "Please login to see all artists."
      redirect '/login'
    end
  end

  get '/artists/:slug' do
    if logged_in?
      @artist = Artist.find_by_slug(params[:slug])
      erb :'/artists/show'
    else
      flash[:message] = "Please login to see the artist page."
      redirect '/login'
    end
  end

  get '/artists/:slug/add_song' do
    if logged_in?
      @artist = Artist.find_by_slug(params[:slug])
      erb :'/artists/add_song'
    else
      flash[:message] = "Please login to add a song."
      redirect '/login'
    end
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
