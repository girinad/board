class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filename
      t.boolean :primary_photo
      t.references :item

      t.timestamps
    end
    add_index :photos, :item_id
  end
end
