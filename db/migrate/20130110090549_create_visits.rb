class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :Agenda
      t.string :Description
      t.string :Date
      t.string :Customers

      t.timestamps
    end
  end
end
