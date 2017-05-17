require 'rails_helper'

RSpec.describe Short, type: :model do
    let(:google) {Short.create(id: 1234567890, url: 'http://www.google.com')}
    
    before do
        
        @url = Short.create(id: 1234567890, url: 'http://algo.com')
    end
    
    context 'Short an URL' do
        it 'has to translate the id to b36' do
            expect(@url.short_url).to eq @url.id.to_s(36)
        end
        
        it 'has to translate the id to b368' do
            google.save
            expect(google.short_url).to eq google.id.to_s(36)
        end
        
        
    end
    
        
end