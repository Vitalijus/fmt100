class ChangeTrackerPrimaryKey < ActiveRecord::Migration[6.1]
  def change
     add_column :trackers, :uuid, :uuid, default: "uuid_generate_v4()", null: false

     change_table :trackers do |t|
       t.remove :id
       t.rename :uuid, :id
     end

     execute "ALTER TABLE trackers ADD PRIMARY KEY (id);"
   end
end
