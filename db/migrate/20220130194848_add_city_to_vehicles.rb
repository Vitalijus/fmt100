class AddCityToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :city, :string
  end
end
