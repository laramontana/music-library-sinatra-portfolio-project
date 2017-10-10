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

end
