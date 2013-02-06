class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
  helper_method :sort_column, :sort_direction
    def agenda
     @visit =  Visit.find(params[:visit])  
     @agenda = Agenda.where(:visit_id=> params[:visit])
     time1 = Time.new
     time1.strftime("%Y-%m-%d %H:%M:%S")
     p time1
      respond_to do |format|
      format.html
      format.csv { send_data @agenda.to_csv }
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{@visit.Agenda}"+"#{time1}"+".xls"}
    end
      
    end
 
    def data
     @agenda = Agenda.where(:visit_id=> params[:visit])


   
   end



    def dbaction
        #called for all db actions
    
    
          date = params["c0"]
          starthour = params["c1"]
          startmin =  params["c2"]
          endhour = params["c3"]
          endmin =  params["c4"]
          duration = params["c5"]
          agenda = params["c6"]
          details = params["c7"]
          clientparticipants   = params["c8"]
          tcsparticipants= params["c9"]
          

        @mode = params["!nativeeditor_status"]
        
        @id = params["gr_id"]
        case @mode
            when "inserted"
                agenda1 = Agenda.new
                agenda1.agendadate = date
                agenda1.StartTimeHour = Integer(starthour)
                agenda1.StartTimeMin = startmin.to_i
                agenda1.EndTimeHour = endhour.to_i
                agenda1.EndTimeMin = endmin.to_i
                if (agenda1.EndTimeHour < agenda1.StartTimeHour)
                 agenda1.timeduration="Invalid time duration"
                 elsif (agenda1.EndTimeMin>=agenda1.StartTimeMin) 

                  agenda1.timeduration="#{(agenda1.EndTimeHour-agenda1.StartTimeHour)}"+" hr(s)"+" #{(agenda1.EndTimeMin-agenda1.StartTimeMin)}"+" mins"

                elsif (agenda1.EndTimeMin<agenda1.StartTimeMin && agenda1.EndTimeMin!=0 )
                   agenda1.timeduration="#{(agenda1.EndTime-agenda1.StartTime)}"+" hr(s)"+" #{(agenda1.StartTimeMin-agenda1.EndTimeMin)}"+" mins"

                elsif (agenda1.EndTimeMin==0 && agenda1.StartTimeMin!=0)
                  agenda1.timeduration="#{(agenda1.EndTime-agenda1.StartTime)-1}"+" hr(s)"+" #{(60-agenda1.StartTimeMin)}"+" mins"
                    elsif (agenda1.EndTimeHour < agenda1.StartTimeHour)
                 agenda1.timeduration="Invalid time duration"
                end
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
                agenda1.agendadate = date
                agenda1.StartTimeHour = Integer(starthour)
                agenda1.StartTimeMin = startmin.to_i
                agenda1.EndTimeHour = endhour.to_i
                agenda1.EndTimeMin = endmin.to_i
                if (agenda1.EndTimeHour < agenda1.StartTimeHour)
               
                 agenda1.timeduration="Invalid time duration"
                elsif (agenda1.EndTimeMin>=agenda1.StartTimeMin) 

                  agenda1.timeduration="#{(agenda1.EndTimeHour-agenda1.StartTimeHour)}"+" hr(s)"+" #{(agenda1.EndTimeMin-agenda1.StartTimeMin)}"+" mins"

                elsif (agenda1.EndTimeMin<agenda1.StartTimeMin && agenda1.EndTimeMin!=0 )
                   agenda1.timeduration="#{(agenda1.EndTimeHour-agenda1.StartTimeHour)}"+" hr(s)"+" #{(agenda1.StartTimeMin-agenda1.EndTimeMin)}"+" mins"

                elsif (agenda1.EndTimeMin==0 && agenda1.StartTimeMin!=0)
                  agenda1.timeduration="#{(agenda1.EndTimeHour-agenda1.StartTimeHour)-1}"+" hr(s)"+" #{(60-agenda1.StartTimeMin)}"+" mins"
                elsif (agenda1.EndTimeHour < agenda1.StartTimeHour)
                 agenda1.timeduration="Invalid time duration"
                end
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
   @visits = Visit.all
 #@visits = Visit.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(5)
 
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
