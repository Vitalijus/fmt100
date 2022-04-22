class Order < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :vehicle

  # validations
  validates :name, :surname, :email_address, :phone_number, :company_title,
            :ad_size, :ad_duration, presence: true
end
