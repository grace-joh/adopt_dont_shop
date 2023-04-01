class ApplicationsController < ApplicationController
  def new
  end

  def create
    @application = Application.create(application_params)
    redirect_to "/applications/#{@application.id}"
  end

  def show
  end

  def application_params
    params.permit(:id, :name, :street_address, :city, :state, :zipcode, :description)
  end
end
