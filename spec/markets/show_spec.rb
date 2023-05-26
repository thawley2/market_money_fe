require 'rails_helper' 

RSpec.describe '/markets/:id', type: :feature do
  describe 'When I visit a markets show page' do
    it 'I see the markets name and address as headers' do
      VCR.use_cassette('markets_show', :allow_playback_repeats => true) do
        facade = MarketsFacade.new(322474)
        market = facade.market
        visit market_path(322474)
        
        expect(page).to have_content(market.name)
        expect(page).to have_content(market.street)
        expect(page).to have_content(market.city)
        expect(page).to have_content(market.state)
      end
    end

    it 'I see a list of vendor names that are at that market' do
      VCR.use_cassette('markets_show', :allow_playback_repeats => true) do
        facade = MarketsFacade.new(322474)
        visit market_path(322474)

        expect(page).to have_content('Vendors at our Market:')

        facade.market_vendors.each do |vendor|
          within "#vendor_#{vendor.id}" do
            expect(page).to have_link(vendor.name)
          end
        end
      end
    end

    it 'Each vendor name is a link to their show page' do
      VCR.use_cassette('markets_show_click_link', :allow_playback_repeats => true) do
        facade = MarketsFacade.new(322474)
        vendor = facade.market_vendors.first
        visit market_path(322474)

        within "#vendor_#{vendor.id}" do
          expect(page).to have_link(vendor.name)

          click_link(vendor.name)

          expect(current_path).to eq(vendor_path(vendor.id))
        end
      end
    end
  end
end