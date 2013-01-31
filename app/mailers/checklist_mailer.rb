class ChecklistMailer < ActionMailer::Base
  default from: "developer@CVPortal.com"

  def test(checklist)
    @checklist = checklist
    mail(:to => checklist.email, :subject => "Checklist for Client's visit to ODC")
  end
end
