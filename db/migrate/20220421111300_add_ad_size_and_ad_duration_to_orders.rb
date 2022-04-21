class AddAdSizeAndAdDurationToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ad_size, :string
    add_column :orders, :ad_duration, :integer
  end
end
