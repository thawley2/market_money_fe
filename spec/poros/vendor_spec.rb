require 'rails_helper' 

RSpec.describe Vendor do
  it 'exists with attributes' do
    vendor_data = {
      id: '123',
      attributes: {
        name: 'Farmers', 
        description: 'Yummy',
        contact_name: 'Steve',
        contact_phone: '5807616264',
        credit_accepted: true
      }
    }

    vendor = Vendor.new(vendor_data)

    expect(vendor.id).to eq('123')
    expect(vendor.name).to eq('Farmers')
    expect(vendor.description).to eq('Yummy')
    expect(vendor.contact_name).to eq('Steve')
    expect(vendor.contact_phone).to eq('5807616264')
    expect(vendor.credit_accepted).to eq(true)
  end
end