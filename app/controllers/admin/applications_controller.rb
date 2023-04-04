class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @app_pets = @application.pets
    
  end

  def update
    app_pet = ApplicationPet.where("pet_id = ? and application_id = ?", params[:pet_id], params[:id])
    app_pet.update(pet_status: "approved")
    redirect_to "/admin/applications/#{params[:id]}"
    
  end
end