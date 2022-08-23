class Order < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :vehicle

  # callbacks
  after_create :unpublish_vehicle

  # validations
  validates :name, :surname, :email_address, :phone_number, :company_title,
            :ad_size, :ad_duration, presence: true

  private

  # Set Vehicle published: false, when creating a new Order for a vehicle.
  # Vehicle is to be published, when no active or pending orders.
  def unpublish_vehicle
    vehicle = Vehicle.find(self.vehicle_id)
    vehicle.update(published: false)
  end
end
