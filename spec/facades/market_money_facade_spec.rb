require 'rails_helper'

RSpec.describe MarketMoneyFacade do
  describe 'Markets' do
    it 'returns an array of market objects for all markets', :vcr do
      markets = MarketMoneyFacade.new.markets

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
      market = MarketMoneyFacade.new(322474).market

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
      vendors = MarketMoneyFacade.new(322474).market_vendors

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
end