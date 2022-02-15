class Video < ApplicationRecord
    validates :title, :date_publish, presence: true 

    validates :link, :format => {
        :with => /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/,
        :multiline => true,
        :message => "Adicione somente links do YouTube."
    }

    extend FriendlyId
      friendly_id :title, use: :slugged #Idk what that do...
    def get_link
        self.link
    end

    def get_embed
        url = get_link

        if url.include? "youtu.be"
            url.sub! 'https://www.youtu.be.com/watch?v=', 'https://www.youtube.com/embed/'
        else 
            url.sub! 'https://www.youtube.com/watch?v=', 'https://www.youtube.com/embed/' 
        end

        url.to_s()
    end

    def get_thumb
        thumbnail = ""
        id = ""
        url_thumb = get_link

        if url_thumb.include? "youtu.be"
            id = url_thumb.slice! "https://www.youtu.be.com/watch?v="
        else 
            id = url_thumb.slice! "https://www.youtube.com/watch?v="
        end

        thumbnail = "http://i1.ytimg.com/vi/"+ url_thumb.to_s() +"/hqdefault.jpg"
        #http://i1.ytimg.com/vi/ouncVBiye_M/hqdefault.jpg # current embed image thumbnail
    end
end
