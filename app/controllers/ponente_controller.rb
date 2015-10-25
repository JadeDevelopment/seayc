class PonenteController < ApplicationController

	def index
		redirect_to ponente_path(current_ponente.id)
	end
	
	def show
		begin
    		@user = Ponente.find(params[:id])
  		rescue
    		@user = Ponente.find(current_ponente.id)
  		end
		
    	unless @user == current_ponente
      		redirect_to :back, :alert => "No puedes acceder."
    	end
	end
end
