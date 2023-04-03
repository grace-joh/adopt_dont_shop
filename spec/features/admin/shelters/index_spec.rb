require 'rails_helper'

RSpec.describe 'Admin Shelters index' do
  before(:each) do
    test_data
    visit '/admin/shelters'
  end

  describe 'User Story 10' do
    it 'lists all shelters in reverse alphabetical order' do
      expect(@shelter1.name).to appear_before(@shelter3.name)
      expect(@shelter2.name).to appear_before(@shelter1.name)
      expect(@shelter4.name).to appear_before(@shelter2.name)
    end
  end

  describe 'User Story 11' do
    it 'states if no shelters have pending applications' do
      expect(page).to have_content('No shelters have pending applications.')
    end

    it 'lists all shelters with a pending application' do
      @app1 = Application.create!(name: 'Grace Joh',
                                  street_address: '1949 Bark St',
                                  city: 'Minneapolis',
                                  state: 'MN',
                                  zipcode: '55414',
                                  home_description: 'I am super nice to animals.',
                                  status: 'Pending')
      @app3 = Application.create!(name: 'Alec Kapicak',
                                  street_address: '312 Meow Ln',
                                  city: 'Chicago',
                                  state: 'IL',
                                  zipcode: '55414',
                                  home_description: 'Seriously, I really really want this animal.',
                                  status: 'Pending')

      expect(page).to have_content('Shelters with Pending Applications')
      expect(page).to have_content(@shelter1.name)
      expect(page).to have_content(@shelter3.name)
      expect(page).to have_content(@shelter4.name)
    end
  end
end
