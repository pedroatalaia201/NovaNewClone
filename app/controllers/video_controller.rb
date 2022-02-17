class VideoController < ApplicationController
  def index
    @videos = Video.all().where("date_publish <= ?", Time.now()).page(params[:page]).per(18)
    #@albums = Album.all.where("date_publish <= ?", DateTime.current).where(status: true).page(params[:page]).per(6)
  end

  def show
    @video = Video.find_by_slug(params[:slug])
  end
end
