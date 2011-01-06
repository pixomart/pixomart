class CategoriesItems < ActiveRecord::Migration
  def self.up
    
    create_table :categories_items, :id => false do |t|
  
      t.integer "category_id"
      t.integer "item_id"
    
    end    
    
      add_index :categories_items, ["category_id", "item_id"]
    
    
  end

  def self.down
  end
end
