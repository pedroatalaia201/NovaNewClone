RailsAdmin.config do |config|
  config.actions do
    featured_content do
      only ['RailsAdminFeaturedContent::FeaturedContent']
    end

    config.model 'RailsAdminFeaturedContent::FeaturedContent' do
      navigation_label "Destaques"
      label "Notícias em Destaque"
      list do
        field :id
        field :title
        field :status
      end
      edit do
        field :title
      end
    end

    config.model 'RailsAdminFeaturedContent::FeaturedContentImage' do
      visible false
    end
  end
end
