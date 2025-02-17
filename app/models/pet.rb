class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :application_pets, dependent: :destroy
  has_many :applications, through: :application_pets, dependent: :destroy

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def status(app_id)
    app_pet = ApplicationPet.find_by("pet_id = ? and application_id = ?", id, app_id)
    app_pet.pet_status
  end
end
