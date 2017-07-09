require 'rails_helper'
include TestHelper::Features

RSpec.feature "Welcome Page", type: :feature do
    
    let(:user){ User.create(email:'example@example.com', password: 'example', password_confirmation: 'example', name: 'User') }
    let(:femaleuser){ User.create(email:'example2@example.com', password: 'example', password_confirmation: 'example', name: 'User', is_female: true) }
    
    before do
        login_user(user.email, "example")
        visit '/'
    end
    
    scenario "Visit the welcome page" do
        expect(page).to have_title('URL Shortener | Welcome')    
    end
    
    scenario 'Render the page content' do
        expect(page).to have_content('Welcome to your account')
        expect(page).to have_content('Hello Mr. User')
        expect(page).to have_link('Manage Ads')
    end
    
    scenario 'Render the page content 2' do
        click_link 'Logout'
        login_user(femaleuser.email, "example")
        expect(page).to have_content('Hello Ms. User')
    end
end
