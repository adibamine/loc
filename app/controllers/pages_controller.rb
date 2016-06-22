class PagesController < ApplicationController
  def home
  	@voitures = Voiture.where(active: true).limit(3)
  end

  def contact
    @email = Email.new
  end

  def offres
    @commande = Commande.new
  end

  def search
  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end

  	arrResult = Array.new
    prix_min = params[:prix_min] ? params[:prix_min] : 0
    prix_max = params[:prix_max] ? params[:prix_max] : 2000
  	if session[:loc_search] && session[:loc_search] != ""
  		@voitures_ville = Voiture.where("active = ? AND ville = ? AND prix > ? AND prix < ?",true, session[:loc_search],prix_min,prix_max).order("rank_date DESC").paginate(page: params[:page], per_page:10)
  	else
  		@voitures_ville = Voiture.where("active= ? AND prix > ? AND prix < ?",true,prix_min,prix_max).order("rank_date DESC").paginate(page: params[:page], per_page:10)
  	end

  	@search = @voitures_ville.ransack(params[:q])
  	@voitures = @search.result

  	@arrVoitures = @voitures.to_a

  	if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)

  		start_date = Date.parse(params[:start_date])
  		end_date = Date.parse(params[:end_date])

  		@voitures.each do |voiture|

  			not_available = voiture.reservations.where(
  					"(? <= start_date AND start_date <= ?)
  					OR (? <= end_date AND end_date <= ?) 
  					OR (start_date < ? AND ? < end_date)",
  					start_date, end_date,
  					start_date, end_date,
  					start_date, end_date
  				).limit(1)

  			if not_available.length > 0
  				@arrVoitures.delete(voiture)	
  			end	

  		end

  	end

  end
end
