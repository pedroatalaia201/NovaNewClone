RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.show_gravatar = false
  
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    # Content_Builder
    config.model "ContentBuilder" do
      navigation_label "Notícia"
      label "Matérias"
      #label "Notícia"
      list do
        field :id
        field :title
        field :count_read
        field :date_publish
        field :status
      end
      edit do
        field :title
        field :date_publish
        field :written_by
        field :content_builder_category do
          inline_add false
          inline_edit false
        end
        field :summary
        field :content_builder_archives
      end
    end

    #Content_Builder_Categories
    config.model 'ContentBuilderCategory' do
      navigation_label 'Notícia'
      label "Categorias"
      list do
        field :id
        field :name
      end
      edit do 
        field :name
      end 
    end

    # Content_Builder_Archives
    config.model "ContentBuilderArchives" do 
      visible false
      edit do 
        field :name
        field :file
      end
    end 

    # Content_Builder_Count_Read
    config.model "ContentBuilderCountRead" do 
      visible false
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
