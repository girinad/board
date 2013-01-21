class MoveMainPhotoIdToItems < ActiveRecord::Migration
  def up
    remove_column :photos, :primary_photo
    add_column :items, :main_photo_id, :integer
    add_index :items, :main_photo_id
  end

  def down
    remove_index :items, :main_photo_id
    remove_column :items, :main_photo_id
    add_column :photos, :primary_photo, :boolean
  end
end
