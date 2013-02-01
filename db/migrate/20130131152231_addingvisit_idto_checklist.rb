class AddingvisitIdtoChecklist < ActiveRecord::Migration
  def up
  	add_column :checklists, :visit_id, :integer
  end

  def down
  	remove_column :checklists, :visit_id
  end
end
