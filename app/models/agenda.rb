class Agenda < ActiveRecord::Base
  attr_accessible :Agenda, :ClientParticipants, :Date, :Details, :Duration, :EndTime, :StartTime, :TCSParticipants
end
