class LawyerController < ApplicationController
    def index
      @lawyers = Lawyer.all
    end
  
    def show
      @lawyer = Lawyer.includes(:availabilities).find(params[:id])
      @client = Client.find(current_user.id)
      @slots = Availability.where(user_id: params[:id])
    end
  end