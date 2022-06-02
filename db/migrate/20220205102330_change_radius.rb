class ChangeRadius < ActiveRecord::Migration[6.1]
  def change
    remove_column :vehicles, :city
    remove_column :vehicles, :radius_size
    remove_column :vehicles, :radius_longitude
    remove_column :vehicles, :radius_latitude
  end
end
