class AddCitiesAndEldershipsToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :cities, :json
    add_column :vehicles, :elderships, :json
  end
end
