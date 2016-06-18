class ReviewsController < ApplicationController

	def index
	  @reviews = current_user.reviews
	  @user = current_user
	end

	def create
		@review = Review.new(review_params)
		if !@review.save
			flash[:alert] = "Merci de remplire tout le formulaire."
		end
		redirect_to @review.user
	end

	def destroy
		@review = Review.find(params[:id])
		user = @review.user
		@review.destroy

		redirect_to user
	end

	private
		def review_params
			params.require(:review).permit(:name, :email, :comment, :star, :user_id)
		end
end