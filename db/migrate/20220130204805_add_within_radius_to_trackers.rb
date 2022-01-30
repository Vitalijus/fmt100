class AddWithinRadiusToTrackers < ActiveRecord::Migration[6.1]
  def change
    add_column :trackers, :within_radius, :boolean
  end
end
