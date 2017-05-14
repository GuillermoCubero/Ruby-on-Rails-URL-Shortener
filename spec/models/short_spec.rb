require 'rails_helper'

RSpec.describe Short, type: :model do
    pending 'add some examples to (or delete) #{__FILE__}'
    
    before do
        @url = Short.create(id: 1234567890, url: 'http://algo.com')
    end
    
    context 'Short an URL' do
        it 'has to short in the rigth way' do
            expect(@url.short_url).to eq @url.id.to_s(36)
        end
    end
end