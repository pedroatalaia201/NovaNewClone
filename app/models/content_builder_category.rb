class ContentBuilderCategory < RailsAdminContentBuilder::ContentBuilderCategory
    has_many :content_builders
  
    def title
     "#{content_builder_category.name} / #{name}"
    end
  
    def self.show(slug)
      find_by_slug(slug).name
    end
  
    def self.categories
      category = ContentBuilderCategory.order(:name)
    end
end
  