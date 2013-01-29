class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.date :Date
      t.time :StartTime
      t.time :EndTime
      t.time :Duration
      t.string :Agenda
      t.text :Details
      t.string :ClientParticipants
      t.string :TCSParticipants

      t.timestamps
    end
  end
end
