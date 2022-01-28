class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.string :manufacturer
      t.string :model
      t.string :plate_number
      t.string :category
      t.string :body_style
      t.string :color
      t.integer :year
      t.integer :ad_size
      t.integer :ad_duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
