require 'rails_helper'

RSpec.describe 'application show page' do
  before(:each) do
    test_data
    visit "/applications/#{@app1.id}"
  end

  describe 'As a visitor when I visit the application show page' do
    it 'displays the applinaction attributes name,
      full address, description, name of all pets, and the status' do


      expect(page).to have_content('Name: Grace Joh')
      expect(page).to have_content('Full Address: 1949 Bark St Minneapolis, MN 55414')
      expect(page).to have_content('Description: I am super nice to animals.')
      expect(page).to have_content('Name of all pets you want to adopt:')
      expect(page).to have_content('Status: In Progress')
    end

    it 'I see a section on the page to Add a Pet to this Application' do
      expect(page).to_not have_content("Leo")
      expect(page).to_not have_content("Luna")

      fill_in 'Search pet name', with: "Leo"
      click_on 'Search'

      expect(current_path).to eq("/applications/#{@app1.id}")
      expect(page).to have_link("Leo")

      fill_in 'Search pet name', with: "Luna"
      click_on 'Search'
save_and_open_page
      expect(current_path).to eq("/applications/#{@app1.id}")
      expect(page).to have_link("Luna")
    end
  end
end

