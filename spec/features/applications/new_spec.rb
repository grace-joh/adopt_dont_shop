require 'rails_helper'

RSpec.describe 'the application new page' do
  before(:each) do
    test_data

    visit '/applications/new'
  end

  it 'displays the new form' do
    expect(page).to have_content('New Application')
    expect(page).to have_content('Name')
    expect(page).to have_content('Street address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zipcode')
    expect(page).to have_content('Description')
    expect(page).to have_button('Submit')
  end

  it 'creates the application and redirects to the application show page' do
    fill_in 'Name', with: @app1.name
    fill_in 'Street address', with: @app1.street_address
    fill_in 'City', with: @app1.city
    fill_in 'State', with: @app1.state
    fill_in 'Zipcode', with: @app1.zipcode
    fill_in 'Description', with: @app1.description
    click_button 'Submit'

    expect(page).to have_current_path("/application/#{@app1.id}")
    expect(page).to have_content(@app1.name)
  end
end
