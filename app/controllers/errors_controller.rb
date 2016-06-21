class ErrorsController < ApplicationController

  def show
    status_code = params[:code] || 500
    flash.alert = "Erreur #{status_code}"
  end

end