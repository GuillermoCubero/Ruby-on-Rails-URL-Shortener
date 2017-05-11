require 'rails_helper'

RSpec.describe Short, type: :model do
    pending 'add some examples to (or delete) #{__FILE__}'
    
    context 'Short an URL' do
        it 'has to appear in to the db' do
            url = Short.create(id: 1234567890, user_url: 'http://algo.com')
            shorted = url.short_url
            expect(Short.find(url.id)).to eq shorted.id #este test debe comprobar 
            # que una vez acortado la url almacenada en la base de datos tiene mismo id que la acortada
        end
    end
end