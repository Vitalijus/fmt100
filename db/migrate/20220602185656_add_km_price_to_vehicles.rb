class AddKmPriceToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :km_price, :decimal, :precision => 8, :scale => 2
  end
end
