require 'rails_helper'

RSpec.feature "Redirect Page", type: :feature do
    
    let(:ad){ Advertisement.create(title: 'Title', user_id: user.id, picture: File.open(File.join(Rails.root,"/app/assets/images/presenta.jpg"))) }
    let(:user){ User.create(email:'example@example.com', password:'password', password_confirmation: 'password', company: 'company') }
    
    before do
        Short.create(id:1, url:'example.com')
        ad
        visit '/1'
    end
    
    scenario "Visit the redirect page" do
        expect(page).to have_title('URL Shortener | Redirecting')    
    end
    
    scenario 'Render the page title' do
        expect(page).to have_content('Redirecting  You will skip the advertisement in:')
    end
    
    scenario 'Render the advertisement' do
        expect(page).to have_content('Advertisement sponsored by: company')
    end
    
end
