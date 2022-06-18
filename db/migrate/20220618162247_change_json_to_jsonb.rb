class ChangeJsonToJsonb < ActiveRecord::Migration[6.1]
  def change
    change_column :vehicles, :cities, :jsonb
    change_column :vehicles, :elderships, :jsonb
  end
end
