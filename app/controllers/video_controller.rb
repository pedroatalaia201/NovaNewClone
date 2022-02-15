class VideoController < ApplicationController
  def index
    @videos = Video.all().where("date_publish <= ?", Time.now())
  end

  def show
    @video = Video.find_by_slug(params[:slug])
  end
end
