class ChangePhotoFieldName < ActiveRecord::Migration
  def up
    rename_column :photos, :filename, :photo
  end

  def down
    rename_column :photos, :photo, :filename
  end
end
