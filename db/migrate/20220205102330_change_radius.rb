class ChangeRadius < ActiveRecord::Migration[6.1]
  def change
    add_column :trackers, :city, :string
    add_column :trackers, :radius_size, :integer
    add_column :trackers, :radius_longitude, :float
    add_column :trackers, :radius_latitude, :float

    remove_column :vehicles, :city
    remove_column :vehicles, :radius_size
    remove_column :vehicles, :radius_longitude
    remove_column :vehicles, :radius_latitude
  end
end
