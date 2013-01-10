class CreateTagsItems < ActiveRecord::Migration
  def up
    create_table 'tags_items' do |t|
      t.integer :tag_id
      t.integer :item_id
    end
  end

  def down
    drop_table 'tags_items'
  end
end
