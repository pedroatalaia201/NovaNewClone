class VideoController < ApplicationController
  def index
    @videos = Video.all().where("date_publish <= ?", Time.now())
  end

  def list
    
  end

  def show
  end
end
