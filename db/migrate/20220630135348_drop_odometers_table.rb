class DropOdometersTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :odometers
  end
end
