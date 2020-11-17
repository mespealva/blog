class PagesController < ApplicationController
  
    def home
      redirect_to articles_path unless current_user.nil?
      @client_id = session[:client_id]
    end
    
    def about
      
    end
    
  end