class ContentBuilderCountRead < ApplicationRecord
    validates :ip, uniqueness: { scope: :content_builder_id }
  
    belongs_to :content_builder
  
    def title
      content_builder.title
    end
  
    def category
      content_builder.category
    end
  
    def slug
      content_builder.slug
    end
end
  