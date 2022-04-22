class AddAdStartAndAdEndToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ad_start, :date
    add_column :orders, :ad_end, :date
  end
end
