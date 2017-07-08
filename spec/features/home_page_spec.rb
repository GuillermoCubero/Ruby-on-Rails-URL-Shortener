require 'rails_helper'

RSpec.feature "HomePage", type: :feature do
    
    before do
        visit '/'
    end
    
    scenario "Visit the home page" do
        expect(page).to have_title('URL Shortener | Home')    
    end
    
    scenario 'render new form' do
        expect(page).to have_button('Create short')
    end
    
end
