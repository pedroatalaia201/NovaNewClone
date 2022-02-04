RailsAdmin.config do |config|
  config.actions do
    content_builder do
      only ['RailsAdminContentBuilder::ContentBuilder']
    end

    config.model 'RailsAdminContentBuilder::ContentBuilder' do
      visible false # evita que fique duplicada na pag admin
      list do
        field :id
        field :title
        field :date_publish
        field :content_builder_category
        field :status
      end
      edit do
        field :title
        field :date_publish
        field :written_by
        field :content_builder_category
      end
    end

    config.model 'RailsAdminContentBuilder::ContentBuilderCategory' do
      visible false
      list do
        field :id
        field :name
      end
      edit do
        field :name
      end
    end

    config.model 'RailsAdminContentBuilder::ContentBuilderImage' do
      visible false
    end
  end
end
