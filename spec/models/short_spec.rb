require 'rails_helper'

RSpec.describe Short, type: :model do
    
    let(:google) {Short.create(id: 123456789, url: 'https://www.google.es')}
    let(:blank) {Short.create(id: 1, url: nil)}
    let(:invalid) {Short.create(id: 2, url: 'http://www.google.')}
    
    context 'Short an URL' do
        
        it 'has to translate the id to b36' do
            expect(google.short_url).to eq google.id.to_s(36)
        end
        
        it 'has to be a valid url' do
            expect(google).to be_valid
        end
        
        it 'has to be a blank invalid url' do
            expect(blank).to_not be_valid
        end
        
        it 'has to be an ivalid url' do
            expect(invalid).to_not be_valid
        end

    end
        
end