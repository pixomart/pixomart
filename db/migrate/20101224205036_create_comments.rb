class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      
      t.integer "status", :limit => 1
      t.string  "comment"
      t.integer "user_id"
      t.integer "item_id"
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
