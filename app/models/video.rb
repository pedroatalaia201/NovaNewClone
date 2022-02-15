class Video < ApplicationRecord
    validates :tile, :date_publish, :link, presence: true 
end
