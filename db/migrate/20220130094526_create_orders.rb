class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :vehicle, null: false, foreign_key: true, type: :uuid
      t.string :phone_number
      t.string :company_title
      t.string :name
      t.string :surname
      t.string :email_address

      t.timestamps
    end
  end
end
