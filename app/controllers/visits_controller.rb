class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
  helper_method :sort_column, :sort_direction
  
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
