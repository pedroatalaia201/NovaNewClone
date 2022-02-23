class Classified < ApplicationRecord
    validates :title, :price, :name, :phone, :email, :description, presence: true

    has_many :classified_images, dependent: :destroy
    accepts_nested_attributes_for :classified_images, allow_destroy: true

    extend FriendlyId
      friendly_id :title, use: :slugged
    def image
        image = ClassifiedImage.where(classified_id: get_id)  
    end

    def get_id
      self.id
    end
end
