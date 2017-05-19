require 'rails_helper'

RSpec.describe Short, type: :model do
    
    let(:short) { Short.create(id: 1234567890, url: 'http://www.google.es') }
    let(:valids) { %w[https://www.google.es http://google.es https://google.es www.google.es google.es] }
    let(:invalids) { %w[http://www.google. https://.google.es http://google. https://google http://.] }
    
    subject { short }
     
    it { should respond_to(:id) }
    it { should respond_to(:url) }
    it { should respond_to(:short_url) }
    
    it { should be_valid }
    
    context 'Short an URL' do
        
        it 'has to translate the id to b36' do
            expect(short.short_url).to eq short.id.to_s(36)
        end
        
        it 'has to percive when url is not present' do
            short.url = nil
            expect(short).not_to be_valid
        end
        
        it 'has to percibe when url is valid' do
            valids.each do |valid_url|
                short.url = valid_url
                expect(short).to be_valid
            end
        end
        
        it 'has to percibe when url is invalid' do
            invalids.each do |invalid_url|
                short.url = invalid_url
                expect(short).not_to be_valid
            end
        end

    end
        
end