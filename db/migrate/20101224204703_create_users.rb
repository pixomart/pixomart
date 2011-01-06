class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      
          t.string    "first_name", :limit => 30
          t.string    "last_name", :limit => 30
          t.string    "email", :limit => 50
          t.string    "encrypted_password"
          t.string    "password_salt"
          t.datetime  "last_login"
          t.integer   "membership_id"
          t.integer   "item_id"
          t.integer   "downloads_count"
          t.string    "user_type", :limit => 20
          t.integer   "status", :limit => 1
          t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
