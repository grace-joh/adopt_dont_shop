require 'rails_helper'

RSpec.describe 'application show page' do
  before(:each) do
    test_data
    visit "/applications/#{@app1.id}"
  end

  describe 'User story 1' do
    it 'displays the page title' do
      expect(page).to have_content('Application to Adopt a Pet')
    end

    it 'displays the application attributes name, full address, home description, pets on application, and the status' do
      expect(page).to have_content('Status: In Progress')
      expect(page).to have_content('Name: Grace Joh')
      expect(page).to have_content('Address: 1949 Bark St Minneapolis, MN 55414')
      expect(page).to have_content('Why my home makes a good home: I am super nice to animals.')
      expect(page).to have_content('I want to adopt:')
      expect(page).to have_link('Leo')
      expect(page).to have_link('Collins')
    end
  end

  describe 'User story 4' do
    it 'I see a section on the page to Add a Pet to this Application' do
      fill_in 'Search pet name', with: 'Luna'
      click_on 'Search'

      expect(current_path).to eq("/applications/#{@app1.id}")
      expect(page).to have_link('Luna')
    end
  end

  describe 'User story 5' do
    it 'I see a button to adopt a pet and can add to list of pets to adopt' do
      expect(page).to have_content('Add a Pet to this Application')

      fill_in 'Search pet name', with: 'Luna'
      click_on 'Search'

      expect(page).to have_link('Luna')

      click_on("Adopt me. I'm lovable!")

      expect(current_path).to eq("/applications/#{@app1.id}")
      expect(page).to have_content('I want to adopt:')
      expect(page).to have_link('Leo')
      expect(page).to have_link('Collins')
      expect(page).to have_link('Luna')
    end
  end

  describe 'User story 6' do
    it 'I see a section to submit my application and removed add pet section' do
      expect(page).to have_content('What makes you a good owner for the pet(s) you want to adopt?')

      fill_in :owner_description, with: 'I have a big backyard'
      click_on 'Submit Application'

      expect(current_path).to eq("/applications/#{@app1.id}")
      expect(page).to have_content('Status: Pending')
      expect(page).to_not have_content('Add a Pet to this Applciation')
    end
  end

  describe 'User story 7' do
    it 'does not show (the list of pets nor) submit section if no pets added' do
      visit "/applications/#{@app5.id}"

      expect(page).to_not have_content('I want to adopt:')

      expect(page).to_not have_content('Submit Application')
      expect(page).to_not have_content('What makes you a good owner for the pet(s) you want to adopt?')
      expect(page).to_not have_button('Submit Application')
    end
  end

  describe 'User story 8' do
    it 'I search for pets by name and I see any pet 
      whose name PARTIALLY matches my search' do
      fill_in 'Search pet name', with: 'Frey'
      click_on 'Search'

      expect(current_path).to eq("/applications/#{@app1.id}")
      expect(page).to have_link('Freyja')
    end
  end

  describe 'User story 9' do
    it 'I search for pets by name and my search is case insensitive' do
      fill_in 'Search pet name', with: 'collins'
      click_on 'Search'

      expect(current_path).to eq("/applications/#{@app1.id}")
      expect(page).to have_link('Collins')
    end
  end
end
