xml.instruct! :xml, :version=>"1.0" 

xml.tag!("rows") do
    @agenda.each do |agenda|
        xml.tag!("row",{ "id" => agenda.id }) do
               
              xml.tag!("cell",  agenda.Date)
              xml.tag!("cell", agenda.StartTime)
              xml.tag!("cell", agenda.StartTimeMin)
              xml.tag!("cell", agenda.EndTime)
              xml.tag!("cell", agenda.EndTimeMin)
              xml.tag!("cell", agenda.Duration)
              xml.tag!("cell", agenda.Agenda)
              xml.tag!("cell", agenda.Details)
              xml.tag!("cell", agenda.ClientParticipants)
              xml.tag!("cell", agenda.TCSParticipants)


       
        end
    end
end

p