class CreateSettings < ActiveRecord::Migration
  
  def self.up
    create_table :settings do |t|
      
      t.string "paypal_account", :limit =>50
      t.timestamps
      
    end
  end

  def self.down
    drop_table :settings
  end
end
