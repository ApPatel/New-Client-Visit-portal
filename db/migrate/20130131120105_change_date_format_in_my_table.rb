class ChangeDateFormatInMyTable < ActiveRecord::Migration
   def self.up
   change_column :agendas, :Date, :string
  end

  def self.down
   change_column :agendas, :Date, :string
  end
end
