module SearchHelper
    def type_name(number_type, category = nil)
      case number_type
        when 1
          "#{category}"
        when 2
          "Fotos"
        when 3
          "Vídeos"
        else
          "#{category}"
      end
    end
  
    def url_link(result_search)
      case result_search[:type]
        when 1
          news_show_path result_search[:category], result_search[:slug]
        when 2
          album_path result_search[:slug]
        when 3
          video_path result_search[:slug]
        else
          result_search[:slug]
      end
    end
  end