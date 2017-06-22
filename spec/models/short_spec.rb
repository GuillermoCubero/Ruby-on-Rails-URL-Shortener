require 'rails_helper'

RSpec.describe Short, type: :model do
    
    let(:short) { Short.create(id: 1234567890, url: 'http://www.google.es') }
    let(:nonprotocolurl) { Short.create(id: 1, url: 'www.google.es') }

    subject { short }
     
    it { should respond_to(:url) }
    it { should respond_to(:short_url) }
    it { should be_valid }
    
    context 'Short_url checking' do
        
        it 'has to translate the id to radix36' do
            expect(short.short_url).to eq short.id.to_s(36)
        end
        
        it 'has to detect when url is null' do
            short.url = ''
            expect(short).not_to be_valid
        end

    end
    
    context 'Short a valid URL' do
        %w[https://www.google.es http://google.es https://google.es www.google.es google.es www.google.es/GOOGLE].each do |valid_url|
            it 'has to short a valid url' do
                short.url = valid_url
                expect(short).to be_valid
            end
        end
        
        it 'has to add protocol if necesary' do
            expect(Short.find(nonprotocolurl.id).url).to eq('http://www.google.es')
        end
    end
    
    context 'Short an invalid URL' do
        %w[http://www.google. https://.google.es http://google. https://google http://. www.GOOGLE.es].each do |invalid_url|
            it 'has to reject an invalid url' do
                short.url = invalid_url
                expect(short).not_to be_valid
            end
        end
    end
        
end