class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable,:trackable,
  devise  :database_authenticatable,:registerable,
    :recoverable, :rememberable,  :validatable, :timeoutable #, :timeout_in => 5.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :role, :status, :remember_me

  def self.deactivate_user deactivate_User_List
    data=User.where('email IN (:selected)', :selected =>deactivate_User_List)
    return data
  end

  def self.reactivate_user reactivate_User_List
    data=User.where('email IN (:reselected)', :reselected =>reactivate_User_List)
    return data
  end

end
