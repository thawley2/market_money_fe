require 'rails_helper'

RSpec.describe MarketMoneyService do
  describe 'Establishes connection' do
    it 'can retrieve a list of all the markets data', :vcr do
      markets = MarketMoneyService.new.find_markets
      
      expect(markets).to have_key(:data)
      expect(markets[:data]).to be_an Array

      markets[:data].each do |market|
        expect(market).to have_key(:id)
        expect(market).to have_key(:type)
        expect(market).to have_key(:attributes)
        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes]).to have_key(:street)
        expect(market[:attributes]).to have_key(:city)
        expect(market[:attributes]).to have_key(:county)
        expect(market[:attributes]).to have_key(:state)
        expect(market[:attributes]).to have_key(:zip)
      end
    end

    it 'can retrieve one market by id', :vcr do
      market_info = MarketMoneyService.new.find_market(322474)

      expect(market_info).to have_key(:data)
      expect(market_info[:data]).to be_a Hash

      market = market_info[:data]

      expect(market).to have_key(:id)
      expect(market).to have_key(:type)
      expect(market).to have_key(:attributes)
      expect(market[:attributes]).to have_key(:name)
      expect(market[:attributes]).to have_key(:street)
      expect(market[:attributes]).to have_key(:city)
      expect(market[:attributes]).to have_key(:county)
      expect(market[:attributes]).to have_key(:state)
      expect(market[:attributes]).to have_key(:zip)
    end
  end
end