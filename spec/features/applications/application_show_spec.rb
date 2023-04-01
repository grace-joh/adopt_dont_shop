require 'rails_helper'

RSpec.describe 'application show page' do
  before(:each) do
    test_data
  end

  describe 'As a visitor when I visit the application show page' do
    it 'displays the applinaction attributes name,
      full address, description, name of all pets, and the status' do

      visit "/applications/#{@app1.id}"

      expect(page).to have_content('Name: Grace Joh')
      expect(page).to have_content('Full Address: 1949 Bark St Minneapolis, MN 55414')
      expect(page).to have_content('Description: I am super nice to animals.')
      expect(page).to have_content('Name of all pets you want to adopt:')
      expect(page).to have_content('Status: In Progress')
    end
  end
end

