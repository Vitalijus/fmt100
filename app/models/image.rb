class Image < ApplicationRecord
  # CarrieWave uploader
  mount_uploader :image, ImageUploader

  # Associations
  belongs_to :vehicle
end
