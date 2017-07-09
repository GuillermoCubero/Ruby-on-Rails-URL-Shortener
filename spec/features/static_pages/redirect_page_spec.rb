require 'rails_helper'

RSpec.feature "Redirect Page", type: :feature do
    
    before do
        Short.create(id:1, url:'example.com')
        visit '/1'
    end
    
    scenario "Visit the redirect page" do
        expect(page).to have_title('URL Shortener | Redirecting')    
    end
    
    scenario 'Render the page content' do
        expect(page).to have_content('Redirecting  You will skip the advertisement in:')
    end
    
end
