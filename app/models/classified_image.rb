class ClassifiedImage < ApplicationRecord
    mount_uploader :image, ImageClassifiedUploader

    validates :image, presence: true
    belongs_to :classified
end
