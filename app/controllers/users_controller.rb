class UsersController < ApplicationController
	before_action :set_user, only: [:show, :increment_num, :increment_msg]

	def show
		increment_counter
		@email = Email.new
		@voitures = @user.voitures.where(active:true)
		@reviews = @user.reviews
	end

	def agence
		url_ = params[:id].to_s
		@user = User.find_by_url(url_)
		increment_counter
		@email = Email.new
		@voitures = @user.voitures.where(active:true)
		@reviews = @user.reviews
		render :template => "users/show"
	end

	def stats
		@user = current_user
	end

	def increment_num
	  @user.increment(:compteur_num, 1)
	  @user.save
	  render nothing: true
	end

	def increment_msg
	  @user.increment(:compteur_msg, 1)
	  @user.save
	  render nothing: true
	end

private
	def set_user
		@user = User.find(params[:id])
	end

	def increment_counter
	  @user.increment(:compteur, 1)
	  @user.save
	end

end