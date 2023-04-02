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
end