class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable,:trackable,
  devise  :database_authenticatable,:registerable,
    :recoverable, :rememberable,  :validatable#, :timeoutable #, :timeout_in => 5.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :role, :id, :status, :remember_me

  def self.edit_user user_id
  	data = User.find(params[:id])
    #data=User.where('email IN (:selected)', :selected =>deactivate_User_List)
    return data
  end
  

end
