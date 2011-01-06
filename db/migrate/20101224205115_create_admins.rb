class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      
      t.string    "email" , :limit => 50
      t.string    "encrypted_password"
      t.string    "password_salt"
      t.string    "name", :limit => 50
      t.datetime  "last_login"

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
