class HomeController < ApplicationController
  def index
    @featured = RailsAdminFeaturedContent::FeaturedContent.where(status: true).first
  end
end
