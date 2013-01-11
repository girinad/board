class RenameTagsItemsToItemsTags < ActiveRecord::Migration
  def change
    rename_table :tags_items, :items_tags
  end
end
