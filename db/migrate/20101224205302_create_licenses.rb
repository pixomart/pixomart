class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      
      t.string  "license_title"
      t.text    "license"
      t.timestamps
      
    end
  end

  def self.down
    drop_table :licenses
  end
end
