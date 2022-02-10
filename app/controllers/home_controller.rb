class HomeController < ApplicationController
  def index
    @featured = RailsAdminFeaturedContent::FeaturedContent.where(status: true).first

    @time = Time.now()
  end
end
