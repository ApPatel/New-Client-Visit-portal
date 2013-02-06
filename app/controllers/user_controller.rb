class UserController < ApplicationController
  
  def new
    @user = User.new
    #@current_users= User.where('Status ="A"')
    #@deactivated_users =User.where('Status ="D"')
  end

  

  def create
    @user = User.new(params[:user])
    @user.Status = 'A'

    puts "*****************************************************************************"
    puts @user.Status + "*****" + @user.email
    puts "*****************************************************************************"


    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to new_user_path
    else
      flash[:notice] = "Sorry, the User could not be created."
      redirect_to new_user_path
    end
  end


end