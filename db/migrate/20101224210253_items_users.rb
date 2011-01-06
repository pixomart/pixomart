class ItemsUsers < ActiveRecord::Migration

  def self.up
  
    create_table :items_users, :id => false do |t|
  
      t.integer "item_id"
      t.integer "user_id"
      
    end
        
      add_index :items_users, ["user_id", "item_id"]
    
  end

  def self.down
    drop_table :items_users
  end
end
