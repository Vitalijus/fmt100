class AddVehicleToOdometers < ActiveRecord::Migration[6.1]
  def change
    add_reference :odometers, :vehicle, null: false, type: :uuid, foreign_key: true
    add_reference :trackers, :vehicle, null: false, type: :uuid, foreign_key: true
  end
end
