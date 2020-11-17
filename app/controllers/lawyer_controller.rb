class LawyerController < ApplicationController
    def index
      @lawyers = Lawyer.all
    end
  
    def show
      @lawyer = Lawyer.includes(:availabilities).find(params[:id])
      @client = Client.find(session[:student_id])
      @slots = Slot.all_with_availabilities(@lawyer.availabilities.ids)
    end
  end