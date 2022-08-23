class ChangeVehicleAdSize < ActiveRecord::Migration[6.1]
  def change
    change_column(:vehicles, :ad_size, :string)
    change_column(:vehicles, :cities, :jsonb, default: [])
    change_column(:vehicles, :elderships, :jsonb, default: [])
  end
end
