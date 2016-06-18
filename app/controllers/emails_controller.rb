class EmailsController < ApplicationController
  
  def create
    @email = Email.new(email_params)
    @email.save
    ContactMailer.send_email(@email).deliver_now
    if(@email.user_id > 0)
      @user = User.find(@email.user_id)
      @user.increment(:compteur_msg, 1)
      @user.save
      redirect_to @user, notice: "Votre email a bien été envoyé."
    elsif(@email.voiture_id > 0)
      @voiture = Voiture.find(@email.voiture_id)
      @voiture.increment(:compteur_msg, 1)
      @voiture.save
      redirect_to @voiture, notice: "Votre email a bien été envoyé."
    else
      redirect_to root_path, notice: "Votre email a bien été envoyé."
    end
  end

  def email_params
    params.require(:email).permit(:voiture_id, :user_id, :nom, :sender_email, :receiver_email, :objet, :contenu)
  end

end