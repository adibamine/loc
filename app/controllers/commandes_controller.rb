class CommandesController < ApplicationController
  
  def index
    @commandes = Commande.all
  end

  def create
  	@commande = Commande.new(commande_params)
    if @commande.save
        redirect_to offres_path, notice: "Bien reçu, on vous contactera dans pas longtemps."
      else
        redirect_to offres_path, notice: "Erreur, merci de réessayer."
    end

  end

  def commande_params
    params.require(:commande).permit(:nom_societe, :email_societe, :tel_societe, :adresse_societe, :note, :plan)
  end

end
