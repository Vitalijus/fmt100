class PagesController < ApplicationController
  def home
    @distances = GoogleMaps::Distance.new.distance
  end
end
