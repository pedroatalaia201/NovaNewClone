class ContentBuilderArchive < ApplicationRecord
    mount_uploader :file, ArchiveNewsUploader
  
    belongs_to :content_builder
end
  