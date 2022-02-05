class RemoveAltitudeAndAngleAndSatellitesFromTrackers < ActiveRecord::Migration[6.1]
  def change
    remove_column :trackers, :altitude
    remove_column :trackers, :angle
    remove_column :trackers, :satellites
  end
end
