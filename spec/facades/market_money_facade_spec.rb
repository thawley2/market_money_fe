require 'rails_helper'

RSpec.describe MarketMoneyFacade do
  describe 'Markets' do
    it 'returns an array of market objects for all markets' do
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
end