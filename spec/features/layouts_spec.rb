require 'rails_helper'

RSpec.feature "Layouts", type: :feature do
    
    before do
        visit '/'
    end
    
    context 'has to render the footer' do 
        it 'has the login link' do
            expect(page).to have_link("Login")
        end
    end
    
    context 'has to render the footer' do 
        it 'has the about link' do
            expect(page).to have_link("About project")
        end
        
        it 'has the code link' do
            expect(page).to have_link("See the code")
        end
        
    end
end
