require 'rails_helper'

RSpec.feature "Layouts", type: :feature do
    
    let(:user) { User.create(id: 1, email:'registeredemail@email.com', password:'admin123', password_confirmation:'admin123', admin: true) }
    
    before do
        visit '/'
    end
    
    context 'has to render the header' do 
        it 'has the login link' do
            expect(page).to have_link("Login")
        end
        
        it 'has the Tools link' do
            login_user(user.email, "admin123")
            expect(page).to have_link("Tools")
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
