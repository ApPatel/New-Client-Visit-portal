class Changecoltypeofduration < ActiveRecord::Migration
   def self.up
   change_column :agendas, :Duration, :string
  end

  def self.down
   change_column :agendas, :Duration, :string
  end
end
