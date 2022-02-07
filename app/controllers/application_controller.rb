class ApplicationController < ActionController::Base
  #require "mini_magick"
  
  before_action :page_info

  protect_from_forgery with: :exception

  helper_method :page_info

  def page_info(name = nil, image = nil)
    # Imagem shared logo (Og:image)
    # Tamanho: 1080x1080
    # Padding: 160px

    @site_name = "CloneNews"
    
    @page_title = name.present? && name.class.eql?(String) ? 
    "#{name} - #{@site_name}" : @site_name

    if image.present? || (name != nil && !name.class.eql?(String))
      @page_image = !name.class.eql?(String) ? name : image
    else 
      @page_image = request.base_url + 
      ActionController::Base.helpers.asset_path("logo-shared.jpg")
    end

    if !Rails.env.development?
      begin
        image_information = MiniMagick::Image.open(@page_image.to_s)
      rescue
        @page_image = request.base_url + 
        ActionController::Base.helpers.asset_path("logo-shared.jpg")

        image_information = MiniMagick::Image.open(@page_image.to_s)
      ensure

        @page_image_width = image_information[:width]
        @page_image_height = image_information[:height]
        @page_image_type = image_information[:format].downcase
      end
    end
  end
end
