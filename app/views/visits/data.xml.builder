xml.instruct! :xml, :version=>"1.0" 

xml.tag!("rows") do
    @agenda.each do |agenda|
        xml.tag!("row",{ "id" => agenda.id }) do
               
              xml.tag!("cell",  agenda.agendadate)
              xml.tag!("cell", agenda.StartTimeHour)
              xml.tag!("cell", agenda.StartTimeMin)
              xml.tag!("cell", agenda.EndTimeHour)
              xml.tag!("cell", agenda.EndTimeMin)
              xml.tag!("cell", agenda.timeduration)
              xml.tag!("cell", agenda.Agenda)
              xml.tag!("cell", agenda.Details)
              xml.tag!("cell", agenda.ClientParticipants)
              xml.tag!("cell", agenda.TCSParticipants)


       
        end
    end
end

p