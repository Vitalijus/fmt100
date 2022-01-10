class CreateTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :trackers do |t|
      t.float :latitude
      t.float :longitude
      t.string :altitude
      t.string :angle
      t.string :satellites
      t.string :speed

      t.timestamps
    end
  end
end
