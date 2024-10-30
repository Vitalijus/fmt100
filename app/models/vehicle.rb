class Vehicle < ApplicationRecord
  # associations
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :images, dependent: :destroy

  # callbacks
  # after_create :vehicle_km_price, :default_cities_and_elderships

  # validations
  validates :manufacturer, :model, :plate_number, :body_style,
            :color, :year, presence: true
  validates :tracker_imei, uniqueness: true, allow_nil: true

  # Ransack needs Vehicle attributes explicitly allowlisted
  def self.ransackable_attributes(auth_object = nil)
    ["ad_duration", "ad_size", "body_style", "category", "cities", "city", "color", "created_at", "elderships", "id",
      "km_price", "last_four_weeks_km", "manufacturer", "model", "percentage", "plate_number", "published",
      "total_km", "tracker_imei", "updated_at", "user_id", "year"]
  end

  private

  # TO DO Flexible pricing
  # def vehicle_km_price
  #   self.update(km_price: 0.02)
  # end
end
