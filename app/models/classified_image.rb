class ClassifiedImage < ApplicationRecord
    mount_uploader :image, ImageClassifiedUploader

    belongs_to :classified
end