require 'rails_helper'

RSpec.describe '/markets', type: :feature do
  
  describe 'When I visit the markets index page' do
    it 'I see all markets listed with their name, city and state' do
      visit '/markets'

      expect(page).to have_content('Name')
      expect(page).to have_content('City')
      expect(page).to have_content('State')
    end

    it "When I click a button to see more info on that market I'm taken to that market's show page '/markets/:id'" do

    end
  end
end
