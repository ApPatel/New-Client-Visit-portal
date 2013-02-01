class Agenda < ActiveRecord::Base
  attr_accessible :agendadate,:timeduration,:StartTimeHour,:EndTimeHour,:Agenda, :ClientParticipants, :Date, :Details, :TCSParticipants,:visit_id


def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
