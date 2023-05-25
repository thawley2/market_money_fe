require 'rails_helper'

RSpec.describe Market do 
  it 'it exists with attributes' do
    market_data = {
      id: '123',
      attributes: {
        name: 'Farmers', 
        street: '123 South st',
        city: 'Littleton',
        county: 'Arapaho',
        state: 'Colorado',
        zip: '80123'
      }
    }

    market = Market.new(market_data)

    expect(market.name).to eq('Farmers')
    expect(market.street).to eq('123 South st')
    expect(market.city).to eq('Littleton')
    expect(market.county).to eq('Arapaho')
    expect(market.state).to eq('Colorado')
    expect(market.zip).to eq('80123')
  end
end