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

end
