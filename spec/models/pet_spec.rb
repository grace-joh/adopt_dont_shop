require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'relationships' do
    it { should belong_to(:shelter) }
    it { should have_many :application_pets }
    it { should have_many(:applications).through(:application_pets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_numericality_of(:age) }
  end

  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)
  end

  describe 'class methods' do
    describe '#search' do
      it 'returns partial matches' do
        expect(Pet.search("Claw")).to eq([@pet_2])
        expect(Pet.search("Cl")).to eq([@pet_2])
        expect(Pet.search("claw")).to eq([@pet_2])
      end
    end

    describe '#adoptable' do
      it 'returns adoptable pets' do
        expect(Pet.adoptable).to eq([@pet_1, @pet_2])
      end
    end
  end

  describe 'instance methods' do
    describe '.shelter_name' do
      it 'returns the shelter name for the given pet' do
        expect(@pet_3.shelter_name).to eq(@shelter_1.name)
      end

    describe '.status' do
      it 'returns the approval status of the pet' do
        app1 = Application.create!(name: 'Grace Joh',
                                   street_address: '1949 Bark St',
                                   city: 'Minneapolis',
                                   state: 'MN',
                                   zipcode: '55414',
                                   home_description: 'I am super nice to animals.',
                                   status: 'In Progress')
        ApplicationPet.create!(application: app1, pet: @pet_1)

        expect(@pet_1.status(app1.id)).to eq('pending')
      end
    end
    end
  end
end
