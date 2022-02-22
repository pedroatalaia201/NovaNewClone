class ClassifiedController < ApplicationController
  def index
    @classifieds = Classified.all().page(params[:page]).per(12)
  end

  def show
    # There will be some stuff...
  end

  def new
  end
end
