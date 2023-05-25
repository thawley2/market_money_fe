require 'rails_helper'

RSpec.describe '/markets', type: :feature do
  
  describe 'When I visit the markets index page' do
    it 'I see all markets listed with their name, city and state' do
      VCR.use_cassette('all_markets', :allow_playback_repeats => true) do

        markets = MarketMoneyFacade.new.markets
        visit markets_path
        
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
    end

    it "When I click a button to see more info on that market I'm taken to that market's show page '/markets/:id'" do
      VCR.use_cassette('all_markets_with_show_path', :allow_playback_repeats => true) do
        markets = MarketMoneyFacade.new.markets
        visit markets_path

        within "#market_#{markets.second.id}" do
          expect(page).to have_content(markets.second.name)
          expect(page).to have_content(markets.second.city)
          expect(page).to have_content(markets.second.state)
          expect(page).to have_button('More Info')

          click_button('More Info')

          expect(current_path).to eq(market_path(markets.second.id))
        end
      end
    end
  end
end
