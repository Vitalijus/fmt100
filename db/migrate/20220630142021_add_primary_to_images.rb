class AddPrimaryToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :primary, :boolean, default: false
  end
end
