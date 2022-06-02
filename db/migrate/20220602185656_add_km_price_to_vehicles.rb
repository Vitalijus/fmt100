class AddKmPriceToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :km_price, :decimal, :precision => 8, :scale => 2
    add_column :odometers, :distance_price, :decimal, :precision => 8, :scale => 5
  end
end
