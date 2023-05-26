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

    it 'Can retrieve a list of vendors for a market', :vcr do
      vendors = MarketMoneyService.new.find_market_vendors(322474)
      
      expect(vendors).to have_key(:data)
      expect(vendors[:data]).to be_an Array
      expect(vendors[:data].first).to have_key(:id)
      expect(vendors[:data].first).to have_key(:attributes)

      vendors[:data].each do |vendor|
        vendor_list = vendor[:attributes]
        expect(vendor_list).to have_key(:name)
        expect(vendor_list).to have_key(:description)
        expect(vendor_list).to have_key(:contact_name)
        expect(vendor_list).to have_key(:contact_phone)
        expect(vendor_list).to have_key(:credit_accepted)
      end
    end

    it 'Can return a vendors data by id', :vcr do
      vendor = MarketMoneyService.new.find_vendor(55297)

      expect(vendor).to have_key(:data)
      expect(vendor[:data]).to have_key(:id)
      expect(vendor[:data]).to have_key(:attributes)
      expect(vendor[:data][:attributes]).to have_key(:name)
      expect(vendor[:data][:attributes]).to have_key(:contact_name)
      expect(vendor[:data][:attributes]).to have_key(:contact_phone)
      expect(vendor[:data][:attributes]).to have_key(:description)
      expect(vendor[:data][:attributes]).to have_key(:credit_accepted)
    end
  end
end