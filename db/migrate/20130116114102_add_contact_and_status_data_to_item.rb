class AddContactAndStatusDataToItem < ActiveRecord::Migration
  def change
    add_column :items, :contact_phone, :string
    add_column :items, :contact_name, :string
    add_column :items, :status, :integer
    add_column :items, :sold_at, :datetime
  end
end
