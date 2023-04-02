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
    @pets = Pet.search(params[:search_pet_name])
  end

  def update
    @application = Application.find(params[:id])
    @pet = Pet.find(params[:pet_id])
    ApplicationPet.create!(application_id: @application.id, pet_id: @pet.id)
    redirect_to "/applications/#{@application.id}"
  end

  private

  def application_params
    params.permit(:id, :name, :street_address, :city, :state, :zipcode, :home_description)
  end
end
