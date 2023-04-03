class ApplicationPetsController < ApplicationController
  def create
    @application = Application.find(params[:id])
    @searched_pet = Pet.find(params[:pet_id])
    ApplicationPet.create!(application_id: @application.id, pet_id: @searched_pet.id)
    redirect_to "/applications/#{@application.id}"
  end
end
