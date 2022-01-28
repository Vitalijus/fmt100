class AddTrackerImeiToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :tracker_imei, :string
  end
end
