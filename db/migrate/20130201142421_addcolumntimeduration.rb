class Addcolumntimeduration < ActiveRecord::Migration
 def self.up

     add_column :agendas, :visitdate, :integer
     add_column :agendas, :timeduration, :string

  end

  def self.down
 
     remove_column :agendas, :visitdate
     remove_column :agendas, :timeduration
  end
end
