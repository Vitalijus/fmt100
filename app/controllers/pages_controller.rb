class PagesController < ApplicationController
  def home
    @distances = Odometer.all
    # @distances = GoogleMaps::Distance.new.distance
  end
end
