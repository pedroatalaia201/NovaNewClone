class ClassifiedImage < ApplicationRecord
    mount_uploader :image, ImageClassifiedUploader

    validates :image, presence: true
end
