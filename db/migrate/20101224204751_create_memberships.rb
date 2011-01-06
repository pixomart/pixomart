class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      
      t.string  "title"
      t.string  "description"
      t.float   "price"
      t.integer "billing_cycle"
      t.integer "status", :limit => 1      
      t.timestamps
      
    end
  end

  def self.down
    drop_table :memberships
  end
end
