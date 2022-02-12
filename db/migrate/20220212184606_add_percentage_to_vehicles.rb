class AddPercentageToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :percentage, :float
  end
end
