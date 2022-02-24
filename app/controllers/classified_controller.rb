class ClassifiedController < ApplicationController
  def index
    @classifieds = Classified.all().page(params[:page]).per(12)
  end

  def show
    @classified = Classified.find_by_slug(params[:slug])
  end

  def new
    @classified = Classified.new
  end

  def edit 
  end

  def create
    @classified = Classified.new(classified_params)

    if @classified.save()
      create_images(params)
      redirect_to classifieds_path()
    else
      p "No, it's not"
      redirect_to root_path()
    end
    
    #@classified.save()
    # respond_to do |format|
    #   if @classified.save
    #     format.html {redirect_to classifieds_path()}
    #   else
    #     format.html {render :new} #vai tentar salvar novamente
    #   end
    # end
  end

  private

  def create_images(params)
    if params[:classified][:classified_images].present?
      params[:classified][:classified_images].each do |img|
        @classified.classified_images.create(image: img)
      end
    end
  end

  def classified_params
    params.require(:classified).permit(
      :title, :price, :name, :phone, :email, :description
    )
  end
end
