class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet
  enum pet_status: { pending: 0, approved: 1, rejected: 2, adopted: 3 }
end