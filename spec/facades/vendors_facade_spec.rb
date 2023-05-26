require 'rails_helper' 

RSpec.describe VendorsFacade do
  describe 'Vendor' do
    it 'returns a single vendor object', :vcr do
      vendor = VendorsFacade.new(55297).vendor
      
      expect(vendor.name).to be_a String
      expect(vendor.description).to be_a String
      expect(vendor.contact_name).to be_a String
      expect(vendor.contact_phone).to be_a String
      expect(vendor.credit_accepted).to be_in([true, false])

    end
  end

  describe 'instance helper methods' do
    before(:each) do
      VCR.use_cassette('vendor') do
        @facade = VendorsFacade.new(55297)
        @vendor = @facade.vendor
      end
    end

    describe '#vendor_contact_name' do
      it 'returns the vendor contact name' do
        expect(@facade.vendor_contact_name).to eq(@vendor.contact_name)
      end
    end

    describe '#vendor_contact_phone' do
      it 'returns the vendor contact phone' do
        expect(@facade.vendor_contact_phone).to eq(@vendor.contact_phone)
      end
    end

    describe '#vendor_credit_accepted' do
      it 'returns if the vendor accepts credit' do
        expect(@facade.vendor_credit_accepted).to eq(@vendor.credit_accepted?)
      end
    end

    describe '#vendor_description' do
      it 'returns the vendors description' do
        expect(@facade.vendor_description).to eq(@vendor.description)
      end
    end
  end
end