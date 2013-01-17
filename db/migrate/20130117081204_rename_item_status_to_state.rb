class RenameItemStatusToState < ActiveRecord::Migration
  def up
    rename_column :items, :status, :state
    change_column :items, :state, :string
  end

  def down
    change_column :items, :state, :integer
    rename_column :items, :state, :status
  end
end
