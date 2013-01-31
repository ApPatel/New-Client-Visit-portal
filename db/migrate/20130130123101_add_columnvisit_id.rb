class AddColumnvisitId < ActiveRecord::Migration
 def up
  	add_column :agendas, :visit_id, :integer
  end

  def down
  	remove_column :agendas, :visit_id
  end
end
