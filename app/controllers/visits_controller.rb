class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
  helper_method :sort_column, :sort_direction
  def agenda
    p "helllllooooooooooooo inside agenda"
     @visit =  Visit.find(params[:visit])  

  end

  def data
 p "helllllooooooooooooo inside data"
     @agenda = Agenda.where(:visit_id=> params[:visit])

   
   end


    def dbaction
        #called for all db actions
      p "helllllooooooooooooo inside dbaction"
      p params["c0"]
      p params["c1"]
      p params["c2"]
      p params["c3"]
      p params["c4"]
      p params["c5"]
      p params["c6"]
      p params["c7"]
          agenda = params["c4"]
          date = params["c0"]
          Date.today.to_s
          starttime   = params["c1"]
      
          endtime = params["c2"]
          duration = params["c3"]
        
          details = params["c5"]
     
         clientparticipants   = params["c6"]
          tcsparticipants= params["c7"]
          

        @mode = params["!nativeeditor_status"]
        
        @id = params["gr_id"]
        case @mode
            when "inserted"
                agenda1 = Agenda.new
                agenda1.Date = "hii"
                agenda1.StartTime = starttime
                agenda1.EndTime = endtime
                agenda1.Duration = duration
                agenda1.Agenda =agenda
                 agenda1.Details =details
                 agenda1.ClientParticipants =clientparticipants
                 agenda1.TCSParticipants =tcsparticipants
                agenda1.visit_id = params[:visit]
                agenda1.save!
                
                @tid = agenda1.id
            when "deleted"
                agenda1=Agenda.find(@id)
                agenda1.destroy
                
                @tid = @id
            when "updated"
                   agenda1=Agenda.find(@id)
             agenda1.Date = date
                agenda1.StartTime = starttime
                agenda1.EndTime = endtime
                agenda1.Duration = duration
                agenda1.Agenda =agenda
                 agenda1.Details =details
                 agenda1.ClientParticipants =clientparticipants
                 agenda1.TCSParticipants =tcsparticipants
                agenda1.visit_id = params[:visit]
                agenda1.save!
                
                @tid = @id
        end 
    end
  def index
  # @visits = Visit.all
 @visits = Visit.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(5)
 
  # @visits = Visit.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(3)
  #     respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @visits }
  #   end
  end



  # GET /visits/1
  # GET /visits/1.json
  def show
    @visit = Visit.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @visit }
    # end
  end

  # GET /visits/new
  # GET /visits/new.json
  def new
    @visit = Visit.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @visit }
    # end
  end

  # GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.html { render action: "new" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.json
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to visits_url }
      format.json { head :no_content }
    end
  end

  private
  
  def sort_column
    Visit.column_names.include?(params[:sort]) ? params[:sort] : "Date"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end



end
