class AlbumController < ApplicationController
  def index
    @albums = Album.all.where("date_publish <= ?", DateTime.current).where(status: true).page(params[:page]).per(6)
  end

  def show
    @album = Album.find_by_slug(params[:slug])

    if !@album.nil?
      @albums = Album.order("date_publish desc").where("id != #{@album.id}").limit(3)
    else  
      redirect_to "/404"
   end
  end

  def list
    #I hope this will get the show page slug, to identify the current album position on the DB
    @album = Album.find_by_slug(params[:slug])

    if !@album.nil?
      @albums = Album.order("date_publish desc").where("id != #{@album.id}").limit(3)
    else
      @albums = Album.all.last(3)
    end
  end
end
