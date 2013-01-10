class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.references :item
      t.references :user

      t.timestamps
    end
    add_index :messages, :item_id
    add_index :messages, :user_id
  end
end
