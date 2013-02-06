class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable,:trackable,
  devise  :database_authenticatable,:registerable,
    :recoverable, :rememberable,  :validatable, :timeoutable #, :timeout_in => 5.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :role, :status, :remember_me

  

end
