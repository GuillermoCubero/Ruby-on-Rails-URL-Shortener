require 'rails_helper'
include TestHelper::Features

RSpec.feature "Layouts", type: :feature do
    
    let(:admin) { User.create(id: 1, email:'registeredemail@email.com', password:'admin123', password_confirmation:'admin123', admin: true) }
    let(:user) { User.create(id: 2, email:'user@email.com', password:'password', password_confirmation:'password') }
    
    before do
        visit '/'
    end
    
    context 'has to render the header' do 
        it 'has the login link' do
            expect(page).to have_link("Login")
        end
        
        it 'has the User Manage links' do
            login_user(user.email, "password")
            expect(page).to have_link("Ads")
            expect(page).to have_link("Profile")
        end
        
        it 'has the Admin Manage links' do
            login_user(admin.email, "admin123")
            expect(page).to have_link("URLs")
            expect(page).to have_link("Users")
            expect(page).to have_link("Ads")
            expect(page).to have_link("Profile")
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
