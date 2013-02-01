class Addcolumnfordatstring < ActiveRecord::Migration
  def up
  	 add_column :agendas, :agendadate, :string
  end

  def down
  end
end
