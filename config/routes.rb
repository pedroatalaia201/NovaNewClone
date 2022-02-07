Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  # News_Paths
  get "noticias" => "news#index", as: :news
  get "noticias/:category" => "news#list_by_category", as: :news_by_category
  get "noticias/:category/:slug" => "news#show", as: :news_show

  # Announce_Path
  get "anuncie" => "announce#index", as: :announce

  # Contact_Path
  get "contato" => "contact#index", as: :contact
  post "contato" => "contacts#create", as: :create_contact

  # OfficeHour_Path
  get "expediente" => "office_hour#index", as: :office_hour
end
