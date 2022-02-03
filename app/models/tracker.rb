class Tracker < ApplicationRecord
  belongs_to :vehicle
  after_create :within_city_radius?
  reverse_geocoded_by :latitude, :longitude

  private

  # Check if Tracker coordinates are within city radius.
  def within_city_radius?
    trackers = Tracker.where(id: self.id)
    within_city = trackers.near([self.vehicle.radius_latitude, self.vehicle.radius_longitude], self.vehicle.radius_size, units: :km)

    # TO DO
    # When vehicle is not within radius then this should be reflected in pricing
    within_city.present? ? trackers.first.update(within_radius: true) : trackers.first.update(within_radius: false)
  end
end
