require 'rails_helper'

RSpec.describe '/vendors/:id', type: :feature do
  describe 'When I visit the vendors show page' do
    it 'I see the vendor name and all of its attributes' do
      VCR.use_cassette('vendor_show', :allow_playback_repeats => true) do
        vendor = VendorsFacade.new(55297).vendor
  
        visit vendor_path(vendor.id)

        expect(page).to have_content(vendor.name)
        expect(page).to have_content('Contact Info:')
        expect(page).to have_content("Name: #{vendor.contact_name}")
        expect(page).to have_content("Phone: #{vendor.contact_phone}")
        expect(page).to have_content("Credit Accepted?: #{vendor.credit_accepted?}")
        expect(page).to have_content("Description: #{vendor.description}")
      end
    end
  end
end