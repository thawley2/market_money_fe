require 'rails_helper' 

RSpec.describe '/markets/:id', type: :feature do
  describe 'When I visit a markets show page' do
    it 'I see the markets name and address as headers' do
      VCR.use_cassette('markets_show', :allow_playback_repeats => true) do
        market_id = '322474'
      end
    end

    it 'I see a list of vendor names that are at that market' do
      VCR.use_cassette('markets_show', :allow_playback_repeats => true) do
        
      end
    end

    it 'Each vendor name is a link to their show page' do
      VCR.use_cassette('markets_show_click_link', :allow_playback_repeats => true) do
        
      end
    end
  end
end