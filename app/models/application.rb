class Application < ApplicationRecord
  has_many :application_pets, dependent: :destroy
  has_many :pets, through: :application_pets

  validates :name, :street_address, :city, :state, :zipcode, :home_description, presence: true
end
