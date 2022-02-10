class Album < ApplicationRecord
    validates :name, :date_publish, presence: true
  
    #Need to include this model on the search.
    searchkick index_prefix: "clonenews"
    #you can delete
    has_many :photos, dependent: :destroy
    accepts_nested_attributes_for :photos, allow_destroy: true
  
    extend FriendlyId
      friendly_id :name, use: :slugged
    def cover
      photos&.first&.image.thumb
    end
  
    def photos_order
      photos.order(id: "asc")
    end
  
    def amount_of_photos
      photos.size
    end
  
    def date_album
      date_publish.strftime("%d/%m/%Y")
    end
  
    def create_associated_image(image)
      photos.create(image: image)
    end
end
  