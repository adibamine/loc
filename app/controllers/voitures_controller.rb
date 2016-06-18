class VoituresController < ApplicationController
before_action :set_voiture, only: [:show, :edit, :update, :disable, :enable, :increment_num, :increment_msg]
before_action :authenticate_user!, except: [:show]

def increment_num
  @voiture.increment(:compteur_num, 1)
  @voiture.save
  render nothing: true
end

def increment_msg
  @voiture.increment(:compteur_msg, 1)
  @voiture.save
  render nothing: true
end

def index
  @voitures = current_user.voitures
  @user = current_user
end

def show
  increment_counter
  @email = Email.new
  @photos = @voiture.photos
end

def new
  @voiture = current_user.voitures.build
end

def create
  @voiture = current_user.voitures.build(voiture_params)
  if current_user.voitures.length > current_user.cars_limit
    flash[:alert] = "Vous avez atteint votre quota de publications."
    render :new
  else
    if @voiture.save
      if params[:images]
        params[:images].each do |image|
          @voiture.photos.create(image: image)
        end
      end

      @photos = @voiture.photos
      redirect_to edit_voiture_path(@voiture), notice: "Enregisté.."
    else
      flash[:alert] = "Merci de remplire tout le formulaire."
      render :new
    end
  end
end

def edit
  if current_user.id == @voiture.user.id
   @photos = @voiture.photos
  else
    redirect_to root_path, notice: "you don't have permission." 
  end
end

def disable
  if current_user.id == @voiture.user.id
   @voiture.update(active: false)
  else
    redirect_to root_path, notice: "you don't have permission." 
  end
  redirect_to voitures_path
end

def enable
  if current_user.id == @voiture.user.id
   @voiture.update(active: true)
  else
    redirect_to root_path, notice: "you don't have permission." 
  end
  redirect_to voitures_path
end


def update
  if @voiture.update(voiture_params)

    if params[:images]
      params[:images].each do |image|
        @voiture.photos.create(image: image)
      end
    end

    redirect_to edit_voiture_path(@voiture), notice: "Saved.."
  else
    render :edit
  end
end

private

  def set_voiture
    @voiture = Voiture.find(params[:id])
  end

  def voiture_params
    params.require(:voiture).permit(:annee, :marque, :modele, :kilometrage, :boite_vitesse, :energie, :consommation, :description, :ville, :prix, :active, :is_clim, :is_direction_assiste, :is_regulateur_vitesse, :is_gps, :is_lecteur_cd, :is_audio_input, :nb_places, :nb_portes, :is_return_marrakech, :is_return_agadir, :is_return_casablanca, :is_return_kenitra, :is_return_laayoun, :is_return_fes, :is_return_rabat, :is_return_essaouira)
  end

  def increment_counter
    @voiture.increment(:compteur, 1)
    @voiture.save
  end
end