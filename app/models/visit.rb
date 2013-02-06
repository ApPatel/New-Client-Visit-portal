class Visit < ActiveRecord::Base
	attr_accessible :attachment
	attr_accessible :Agenda
	attr_accessible :Description
	attr_accessible :Date
	attr_accessible :Customers

    has_many :agendas
    has_one :checklist, :dependent => :destroy

	
	attr_accessor :attachment

	has_attached_file :attachment


end
