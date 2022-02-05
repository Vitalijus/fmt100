class AddCityAndWithinRadiusToOdometers < ActiveRecord::Migration[6.1]
  def change
    add_column :odometers, :city, :string
    add_column :odometers, :within_radius, :boolean
  end
end
