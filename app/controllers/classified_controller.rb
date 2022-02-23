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

  def edit 
  end

  def create
    @classified = Classified.new(classified_params)
    @classified.save()

    if @classified.save
      p "It's saved"
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

  def classified_params
    params.require(:classified).permit(
      :title, :price, :name, :phone, :email, :description
    )
  end
end
