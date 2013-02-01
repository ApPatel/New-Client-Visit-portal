class Addcolumnforminandhour < ActiveRecord::Migration
  def self.up

     add_column :agendas, :StartTimeMin, :integer
     add_column :agendas, :EndTimeMin, :integer
  end

  def self.down

     remove_column :agendas, :StartTimeMin, :integer
     remove_column :agendas, :EndTimeMin, :integer
  end
end
