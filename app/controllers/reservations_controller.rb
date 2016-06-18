class ReservationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_reservation, only: [:edit, :update, :disable, :enable]
	before_action :check_permission, only: [:edit, :disable, :enable]
	
	def preload
		voiture = Voiture.find(params[:voiture_id])
		today = Date.today
		reservations = voiture.reservations.where("start_date >= ? OR end_date >= ?", today, today)

		render json: reservations
	end

	def preview
		start_date = Date.parse(params[:start_date])
		end_date = Date.parse(params[:end_date])

		output = {
			conflict: is_conflict(start_date, end_date)
		}

		render json:output
	end

	def index
		@reservations = current_user.reservations.where(active: true)
	end

	def new
		@voiture = Voiture.find(params[:id])
	    @reservation = Reservation.new
	    @reservation.build_client
	end

	def create
    	@reservation = Reservation.new(reservation_params)
    	if @reservation.save
      		redirect_to @reservation.voiture, notice: "Votre reservation a bien ete cree"
    	else
      		render :new
    	end
  	end

  	def edit
  	end

	def update
  		if @reservation.update(reservation_params)
	    	redirect_to edit_reservation_path(@reservation), notice: "Sauvegardé.."
	  	else
	    	render :edit
	  	end
	end

	def disable
	   @reservation.update(active: false)
	   redirect_to reservations_path
	end

	private
		def is_conflict(start_date, end_date)
			voiture = Voiture.find(params[:voiture_id])

			check = voiture.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
			check.size > 0? true : false
		end


		def set_reservation
		    @reservation = Reservation.find(params[:id])
		end

		def check_permission
			if @reservation.voiture.user != current_user
				redirect_to root_path, notice: "Vous n'avez pas le droit." 
			end
		end

		def reservation_params
		    params.require(:reservation).permit(
		      :start_date, :end_date, :prix, :total, :voiture_id, client_attributes: [:nom, :prenom, :cin, :age, :ville, :telephone, :email]
		    )
		end


end