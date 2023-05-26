require 'rails_helper'

RSpec.describe MarketsFacade do
  describe 'Markets' do
    it 'returns an array of market objects for all markets', :vcr do
      markets = MarketsFacade.new.markets

      expect(markets).to be_an Array
      expect(markets.first).to be_a Market
      
      market = markets.first

      expect(market.name).to be_a String
      expect(market.street).to be_a String
      expect(market.city).to be_a String
      expect(market.county).to be_a String
      expect(market.state).to be_a String
      expect(market.zip).to be_a String
    end
  end

  describe 'Market' do
    it 'returns a single market object', :vcr do
      market = MarketsFacade.new(322474).market

      expect(market).to be_a Market
      expect(market.name).to be_a String
      expect(market.street).to be_a String
      expect(market.city).to be_a String
      expect(market.county).to be_a String
      expect(market.state).to be_a String
      expect(market.zip).to be_a String
    end
  end

  describe 'Market Vendors' do
    it 'returns an array of Vendor objects for a specific Market', :vcr do
      vendors = MarketsFacade.new(322474).market_vendors

      expect(vendors).to be_an Array
      expect(vendors.first).to be_a Vendor
      
      vendor = vendors.first

      expect(vendor.name).to be_a String
      expect(vendor.description).to be_a String
      expect(vendor.contact_name).to be_a String
      expect(vendor.contact_phone).to be_a String
      expect(vendor.credit_accepted).to be_in([true, false])
    end
  end

  describe 'instance helper methods' do
    describe '#market_name' do
      it 'returns the name of the market', :vcr do
        facade = MarketsFacade.new(322474)

        expect(facade.market_name).to eq(facade.market.name)
      end
    end

    describe '#market_street' do
      it 'returns the street name of the market', :vcr do
        facade = MarketsFacade.new(322474)

        expect(facade.market_street).to eq(facade.market.street)
      end
    end

    describe '#market_city_state_zip' do
      it 'returns the city state and zip of a market', :vcr do
        facade = MarketsFacade.new(322474)

        expect(facade.market_city_state_zip).to eq("#{facade.market.city}, #{facade.market.state} #{facade.market.zip}")
      end
    end
  end
end