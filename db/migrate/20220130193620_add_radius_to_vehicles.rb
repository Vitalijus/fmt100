class AddRadiusToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :radius_latitude, :float
    add_column :vehicles, :radius_longitude, :float
    add_column :vehicles, :radius_size, :integer
  end
end
