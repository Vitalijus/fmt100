class AddPublishedToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :published, :boolean, default: false
  end
end
