class Addcolumnforhoursandremovestartandendtime < ActiveRecord::Migration
  def self.up

     add_column :agendas, :StartTimeHour, :integer
     add_column :agendas, :EndTimeHour, :integer

  end

  def self.down
 
     remove_column :agendas, :StartTimeHour, :integer
     remove_column :agendas, :EndTimeHour, :integer
  end
end
