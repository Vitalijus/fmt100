class Vehicle < ApplicationRecord
  # associations
  belongs_to :user
  has_many :odometers, dependent: :destroy
  has_many :trackers, dependent: :destroy
  has_many :orders, dependent: :destroy

  # callbacks
  before_create :set_radius

  # validations
  validates :tracker_imei, uniqueness: true, allow_nil: true

  private

  # TO DO
  # Move set_radius to Tracker

  # Set within what radius vehicle's coordinates should be saved.
  def set_radius
    city = self.city

    map_city.each do |city|
      if city[:city] == "Minsk"
        self.radius_size = city[:radius_size]
        self.radius_latitude = city[:radius_latitude]
        self.radius_longitude = city[:radius_longitude]
      end
    end
  end

  def map_city
    [
      { city: "Minsk", radius_size: 15, radius_latitude: 53.90126068000729, radius_longitude: 27.555019995465507}
    ]
  end
end
