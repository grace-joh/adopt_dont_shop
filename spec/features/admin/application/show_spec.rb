require 'rails_helper'

RSpec.describe "admin/application show page" do
  before(:each) do
    test_data
    visit "/admin/applications/#{@app1.id}"
  end

  describe 'User Story 12' do
    it 'displays an approve button that can approve each pet' do
      click_on "Approve #{@pet1.name}"

      expect(current_path).to eq("/admin/applications/#{@app1.id}")
      expect(page).to_not have_button("Approve #{@pet1.name}")
      expect(page).to have_content("#{@pet1.name} has been approved!")
    end
  end

  describe 'User Story 13' do
    it 'displays an reject button that can reject each pet' do
      click_on "Reject #{@pet1.name}"

      expect(current_path).to eq("/admin/applications/#{@app1.id}")
      expect(page).to_not have_button("Approve #{@pet1.name}")
      expect(page).to_not have_button("Reject #{@pet1.name}")
      expect(page).to have_content("#{@pet1.name} has been rejected \u{1F622}")
    end
  end

  describe 'User Story 14' do
    it 'can approve a pet on one app and not affect the same pet on another app' do
      visit "/admin/applications/#{@app2.id}"

      click_on "Approve #{@pet3.name}"

      expect(current_path).to eq("/admin/applications/#{@app2.id}")
      expect(page).to have_content("#{@pet3.name} has been approved!")

      visit "/admin/applications/#{@app4.id}"

      expect(page).to_not have_content("#{@pet3.name} has been approved!")
      expect(page).to have_button("Approve #{@pet3.name}")
      expect(page).to have_button("Reject #{@pet3.name}")
    end

    it 'can reject a pet on one app and not affect the same pet on another app' do
      visit "/admin/applications/#{@app2.id}"

      click_on "Reject #{@pet3.name}"

      expect(current_path).to eq("/admin/applications/#{@app2.id}")
      expect(page).to have_content("#{@pet3.name} has been rejected \u{1F622}")

      visit "/admin/applications/#{@app4.id}"

      expect(page).to_not have_content("#{@pet3.name} has been rejected \u{1F622}")
      expect(page).to have_button("Approve #{@pet3.name}")
      expect(page).to have_button("Reject #{@pet3.name}")
    end
  end
end
