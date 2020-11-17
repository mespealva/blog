class ClientController < ApplicationController
    before_action :setup_client, :setup_time_zones, only: [:new]
  
    def new; end
  
    def create
      client = Client.new(full_name: client_params[:name], time_zone: client_params[:time_zone])
      if client.save
        session[:client_id] = client.id
        redirect_to lawyers_path
      else
        @client = client
        setup_time_zone
        render action: :new
      end
    end
  
    def logout
      session[:client_id] = nil
      redirect_to root_path
    end
  
    private
  
    def client_params
      params.require(:client).permit(:full_name, :time_zone)
    end
  
    def setup_client
      @client = Client.new
    end
  
    def setup_time_zone
      @time_zone = "GMT-3"
    end
  end