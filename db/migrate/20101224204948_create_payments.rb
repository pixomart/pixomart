class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      
      t.integer "user_id"
      t.float   "amount", :precision => 2
      t.integer "payment_status", :limit => 1
      t.integer "payment_type", :limit => 1
      t.integer "membership_id"
      t.timestamps
      
    end
  end

  def self.down
    drop_table :payments
  end
end
