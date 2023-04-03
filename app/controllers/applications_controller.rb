class ApplicationsController < ApplicationController
  def new
  end

  def create
    @application = Application.new(application_params)

    if @application.valid?
      @application.save
      redirect_to "/applications/#{@application.id}"
    else
      flash[:message] = @application.errors.full_messages.join(', ')
      render :new
    end
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
end
