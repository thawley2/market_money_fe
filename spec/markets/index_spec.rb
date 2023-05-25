require 'rails_helper'

RSpec.describe '/markets', type: :feature do
  
  describe 'When I visit the markets index page' do
    it 'I see all markets listed with their name, city and state' do
      markets = MarketMoneyFacade.new.markets
      visit '/markets'
      
      expect(page).to have_content('Name')
      expect(page).to have_content('City')
      expect(page).to have_content('State')

      within "#market_#{markets.first.id}" do
        expect(page).to have_content(markets.first.name)
        expect(page).to have_content(markets.first.city)
        expect(page).to have_content(markets.first.state)
        expect(page).to have_button('More Info')
      end
      within "#market_#{markets.second.id}" do
        expect(page).to have_content(markets.second.name)
        expect(page).to have_content(markets.second.city)
        expect(page).to have_content(markets.second.state)
        expect(page).to have_button('More Info')
      end
    end

    it "When I click a button to see more info on that market I'm taken to that market's show page '/markets/:id'" do
      markets = MarketMoneyFacade.new.markets
      visit '/markets'
    end
  end
end
