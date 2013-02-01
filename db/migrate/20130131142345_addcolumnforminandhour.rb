class Addcolumnforminandhour < ActiveRecord::Migration
  def self.up
   change_column :agendas, :StartTime, :integer
     change_column :agendas, :EndTime, :integer
     add_column :agendas, :StartTimeMin, :integer
     add_column :agendas, :EndTimeMin, :integer
  end

  def self.down
   change_column :agendas, :StartTime, :integer
     change_column :agendas, :EndTime, :integer
     remove_column :agendas, :StartTimeMin, :integer
     rmove_column :agendas, :EndTimeMin, :integer
  end
end
