class Checklist < ActiveRecord::Base
  attr_accessible :GroundTransCheck, :GroundTransComment, :LaptopPassCheck, 
  					:LaptopPassComment, :ODCAccessCheck, :ODCAccessComment, 
  					:SEZPassCheck, :SEZPassComment, :TCSVisitorPassCheck, 
  					:TCSVisitorPassComment, :email, :visit_id


  belongs_to :visit
  
end
