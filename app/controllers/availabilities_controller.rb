class AvailabilitiesController < ApplicationController
    before_action :set_availability, only: [:show, :edit, :update, :destroy]
  
    # GET /availabilities
    # GET /availabilities.json
    def index
      @availabilities = Availability.where(user_id: current_user.id)
    end
  
    # GET /availabilities/1
    # GET /availabilities/1.json
    def show
    end
  
    # GET /availabilities/new
    def new
      @availability = Availability.new
      
    end
  
    # GET /availabilities/1/edit
    def edit
    end
  
    # POST /availabilities
    # POST /availabilities.json
    def create
      @availability = Availability.new(availability_params)
      @availability.user_id = current_user.id
  
      respond_to do |format|
        if @availability.save
          @slot= Slot.create(availability_id: @availability.id)
          format.html { redirect_to @availability, notice: 'Availability was successfully created.' }
          format.json { render :show, status: :created, location: @availability }
        else
          format.html { render :new }
          format.json { render json: @availability.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /availabilities/1
    # PATCH/PUT /availabilities/1.json
    def update
      respond_to do |format|
        if @availability.update(availability_params)
          format.html { redirect_to @availability, notice: 'Availability was successfully updated.' }
          format.json { render :show, status: :ok, location: @availability }
        else
          format.html { render :edit }
          format.json { render json: @availability.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /availabilities/1
    # DELETE /availabilities/1.json
    def destroy
      @availability.destroy
      respond_to do |format|
        format.html { redirect_to availabilities_url, notice: 'Availability was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_availability
        @availability = Availability.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def availability_params
        params.require(:availability).permit(:day_of_week, :start, :end)
      end
    end