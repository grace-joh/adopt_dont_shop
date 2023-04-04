class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @app_pets = @application.pets
  end

  def update
    pet_id = params[:approved] || params[:rejected]
    app_pet = ApplicationPet.find_by('pet_id = ? and application_id = ?', pet_id, params[:id])
    if params[:approved]
      app_pet.approved!
    elsif params[:rejected]
      app_pet.rejected!
    end
    redirect_to "/admin/applications/#{params[:id]}"
  end
end
