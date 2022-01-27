class CreateOdometers < ActiveRecord::Migration[6.1]
  def change
    create_table :odometers do |t|
      t.string :destination_address
      t.string :origin_address
      t.integer :distance
      t.integer :duration

      t.timestamps
    end
  end
end
