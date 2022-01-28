class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :odometers, dependent: :destroy
  has_many :trackers, dependent: :destroy
end
