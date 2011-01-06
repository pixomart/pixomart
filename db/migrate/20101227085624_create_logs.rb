class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
        t.integer "admin_id"
        t.string "action"
        t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
