class RenouvellementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @renouvellements = current_user.renouvellements.paginate(page: params[:page], per_page:10)
    @user = current_user
  end

  def new
    @voiture = Voiture.find(params[:id])
    @renouvellement = @voiture.renouvellements.build
  end

  def create
    @renouvellement = current_user.renouvellements.build(renouvellement_params)
    if @renouvellement.save
      @renouvellement.voiture.update_columns(rank_date: Time.current)
      flash[:info] = "Renouvellement réussi."
    else
      flash[:alert] = "Erreur."
    end
    redirect_to renouvellements_path
  end


private

  def renouvellement_params
    params.require(:renouvellement).permit(:voiture_id)
  end

end
