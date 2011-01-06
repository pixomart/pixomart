class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      
      t.string  "title"
      t.integer "downloads"
      t.integer "rating", :limit => 5
      t.string  "decription"
      t.string  "files_included"
      t.string  "dimensions", :limit => 20
      t.integer "layered", :limit => 1
      t.string  "adobe_version", :limit => 30
      t.float   "price", :precision => 2
      t.string  "notes"
      t.string  "file_type", :limit => 30
      t.string  "thumbnail_images"
      t.string  "preview_images"
      t.integer "license_id"
      t.integer "status", :limit => 1
      t.integer "purchases"
      t.timestamps
      
    end
  end

  def self.down
    drop_table :items
  end
end
