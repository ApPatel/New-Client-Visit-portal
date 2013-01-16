class AddingStatusToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :Status, :string
  end

  def down
  	remove_column :users, :Status
  end
end
