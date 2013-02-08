class UsersController < ApplicationController
  
  def new
    @user = User.new
    #@current_users= User.where('Status ="A"')
    #@deactivated_users =User.where('Status ="D"')
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end




  # POST /users
  # POST /users.json

  def create
    @user = User.new(params[:user])
    @user.Status = 'A'

    puts "*****************************************************************************"
    puts @user.Status + "*****" + @user.email
    puts "*****************************************************************************"


    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to users_path
    else
      flash[:notice] = "Sorry, the User could not be created."
      redirect_to users_path
    end
  end


  # GET /users/1/edit
  def edit
      @user= User.find(params[:id])
  end

def update
  @user = User.find(params[:id])
  
  if @user.update_attributes(params[:user])
            flash[:notice] = "Successfully Updated User."
            redirect_to users_path
         else
            flash[:notice] = "User Could Not Be Updated."
            render :action => :edit
        end
end


     





    #@user = User.find(params[:id])
    #puts params[:id]
    #puts "*******************************EDIT---new**********************************************"
    #puts @user.Status + "*****" + @user.email
    #puts "*******************************EDIT**********************************************"

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_index_url }
      format.json { head :no_content }
    end
  end
end