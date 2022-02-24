class Classified < ApplicationRecord
    validates :title, :price, :name, :phone, :email, :description, presence: true

    has_many :classified_images, dependent: :destroy
    accepts_nested_attributes_for :classified_images, allow_destroy: true

    extend FriendlyId
      friendly_id :title, use: :slugged

    def image
      if !classified_images.empty?
        classified_images.first.image
      else
        nil
      end 
    end

    def product_images
      classified_images
    end
end
