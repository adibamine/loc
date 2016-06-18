class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update]

  def new
  	@voiture = Voiture.find(params[:id])
    @client = Client.new
    @client.reservations.build
  end

 def create
   @client = Client.new(client_params)
   if @client.save!
	 redirect_to @client.reservation.voiture, notice: "Votre reservation a bien ete cree"
   else
     render :new, id: params[voiture_id]
   end
 end

  def update
      if @client.update(client_params)
        redirect_to edit_client_path(@client), notice: "Sauvegardé.."
      else
        render :edit
      end
  end

private

  def client_params
    params.require(:client).permit(:nom, :prenom, :cin, :age, :ville, :telephone, :email, reservations_attributes: [:start_date, :end_date, :prix, :total, :voiture_id])
  end

  def set_client
    @client = Client.find(params[:id])
  end

end