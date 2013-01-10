class Visit < ActiveRecord::Base
	attr_accessible :attachment
	attr_accessible :Agenda
	attr_accessible :Description
	attr_accessible :Date
	attr_accessible :Customers

	attr_accessor :attachment

	has_attached_file :attachment

end
