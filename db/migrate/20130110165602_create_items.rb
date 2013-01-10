class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.reference :user

      t.timestamps
    end
    add_index :items, :user_id
  end
end
