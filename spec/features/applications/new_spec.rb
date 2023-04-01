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
    expect(page).to have_content('What makes your home a good home?')
    expect(page).to have_button('Submit')
  end

  it 'creates the application and redirects to the application show page' do
    fill_in 'Name', with: 'John Doe'
    fill_in 'Street address', with: '1234 Street Rd'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zipcode', with: '80821'
    fill_in :home_description, with: 'I like dogs'
    click_button 'Submit'
    # require 'pry'; binding.pry
    @new_app = Application.all.last
    expect(current_path).to eq("/applications/#{@new_app.id}")
    expect(page).to have_content(@new_app.name)
  end

  it 're-renders the new form' do
    visit '/applications/new'

    click_button 'Submit'

    expect(page).to have_current_path('/applications/new')
    expect(page).to have_content("Name can't be blank, Street address can't be blank, City can't be blank, State can't be blank, Zipcode can't be blank, Home description can't be blank")
  end
end
