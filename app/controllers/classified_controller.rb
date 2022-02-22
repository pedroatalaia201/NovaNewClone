class ClassifiedController < ApplicationController
  def index
    @classifieds = Classified.all().page(params[:page]).per(12)
  end

  def show
    # There will be some stuff...
  end

  def new
    @classified = Classified.new
  end

  def create
    @classified = Classified.new(classified_params)
    
    respond_to do |format|
      if @classified.save
        format.html {redirect_to classifieds_path()}
      else
        format.html {render :new} #vai tentar salvar novamente
      end
    end
  end

  private

  def classified_params
    params.require(:classified).permit(
      :title, :price, :name, :phone, :email, :description, {images: []} 
    )
  end
end
