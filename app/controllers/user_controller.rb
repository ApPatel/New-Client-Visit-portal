class UserController < ApplicationController
  
  def new
    @user = User.new
    @current_users= User.where('Status ="A"')
    @deactivated_users =User.where('Status ="D"')
  end

  def manageUser
    submit= "Submit"
    case submit
    when params[:deactivate_user_submit]
      @data= User.deactivate_user params[:deactivate_User_List]
      @data.each do |user_record|
        user_record.Status = 'D'
        user_record.save
        @DeFlag=user_record.save

      end
      
      if @DeFlag
        flash[:notice] = "Successfully De-Activated User."
        redirect_to new_user_path
      else
        flash[:notice] = "User Could not be deactivated."
        redirect_to new_user_path
      end


    when params[:reactivate_user_submit]
      @data1= User.reactivate_user params[:reactivate_User_List]
      @data1.each do |user_record|
        user_record.Status = 'A'
        user_record.save
        @ReFlag=user_record.save
      end

      if @ReFlag
        flash[:notice] = "Successfully Re-Activated User."
        redirect_to new_user_path
      else
        flash[:notice] = "User Could notbe reactivated."
        redirect_to new_user_path
      end
    end

    deactivate= "Deactivate"
    case deactivate
    when params[:deactivate_current_user_submit]
      @email = current_user.email
      puts @email
      @current_user= User.where("email = '#{@email}'")
      @current_user.each do |user|
        user.Status = 'D'
        user.save
        @ReFlag=user.save
      end
      if @ReFlag
        flash[:notice] = "Successfully De-Activated User."
        redirect_to new_user_path
      else
        flash[:notice] = "User Could not be deactivated."
        redirect_to new_user_path
      end

    end

  end

  def create
    @user = User.new(params[:user])
    @user.Status = 'A'

    puts "*****************************************************************************"
    puts @user
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