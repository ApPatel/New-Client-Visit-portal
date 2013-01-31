class Checklist < ActiveRecord::Base
    attr_accessible :visit_id,:ground_trans_check, :ground_trans_text, 
  				  :laptop_pass_check, :laptop_pass_text, :odc_access_check, 
  				  :odc_access_text, :sez_pass_check, :sez_pass_text, 
  				  :tcs_visitor_pass_check, :tcs_visitor_pass_text, :email
  belongs_to :visit
end
