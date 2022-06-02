class DropTrackersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :trackers
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
