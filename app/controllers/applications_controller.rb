class ApplicationsController < ApplicationController
  def new
  end

  def create
    @application = Application.new(application_params)
    save_or_error(@application)
  end

  def show
    @application = Application.find(params[:id])
    @pets = Pet.search(params[:search_pet_name]) if params[:search_pet_name].present?
  end

  def update
    application = Application.find(params[:id])
    application.update(application_params)
    redirect_to "/applications/#{application.id}"
  end

  private

  def application_params
    params.permit(:id, :name, :street_address, :city, :state, :zipcode, :home_description, :status, :owner_description)
  end

  def save_or_error(app)
    if app.save
      redirect_to "/applications/#{app.id}"
    else
      flash[:message] = app.errors.full_messages.join(', ')
      render :new
    end
  end
end
