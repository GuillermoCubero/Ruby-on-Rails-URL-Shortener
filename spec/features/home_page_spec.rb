require 'rails_helper'

RSpec.feature "HomePage", type: :feature do
    
    before do
        visit '/'
    end
    
    scenario "render the unique value proposition" do
        expect(page).to have_title('URL Shortener | Home')    
    end
    
    scenario 'render the call to action' do
        expect(page).to have_link('Start shorting now!')
    end
    
end
