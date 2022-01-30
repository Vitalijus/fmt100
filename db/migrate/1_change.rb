class Change < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'uuid-ossp'
     add_column :odometers, :uuid, :uuid, default: "uuid_generate_v4()", null: false

     change_table :odometers do |t|
       t.remove :id
       t.rename :uuid, :id
     end

     execute "ALTER TABLE odometers ADD PRIMARY KEY (id);"
   end
end
