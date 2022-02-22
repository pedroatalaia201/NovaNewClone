class Classified < ApplicationRecord
    validates :title, :price, :name, :phone, :email, :description, presence: true

    has_many :classified_images
end
