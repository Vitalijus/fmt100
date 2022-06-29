class Vehicle < ApplicationRecord
  # associations
  belongs_to :user
  has_many :odometers, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :images, dependent: :destroy

  # callbacks
  after_create :vehicle_km_price, :default_cities_and_elderships

  # validations
  validates :manufacturer, :model, :plate_number, :category, :body_style,
            :color, :year, :ad_size, :ad_duration, presence: true
  validates :tracker_imei, uniqueness: true, allow_nil: true

  def vehicle_km_price
    self.update(km_price: 0.02)
  end

  def default_cities_and_elderships
    self.update(cities: [], elderships: [])
  end
end
