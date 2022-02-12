class AddCityAndTotalKmAndLastFourWeeksKm < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :city, :string
    add_column :vehicles, :total_km, :integer
    add_column :vehicles, :last_four_weeks_km, :integer
  end
end
