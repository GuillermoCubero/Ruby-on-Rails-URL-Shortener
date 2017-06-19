require 'rails_helper'

RSpec.feature "ForgotPassword Page", type: :feature do
    
    before do
        User.create(email:'registeredemail@email.com', password:'admin123', password_confirmation: 'admin123', admin: true)
        visit '/users/password/new'
    end
    
    scenario 'Visit the Forgot Password Page' do
        expect(page).to have_title('URL Shortener | Forgot Password')
    end
    
    scenario 'Introduce a no registered email' do
      fill_in 'Email', with: 'noexiste@email.com'
      click_button 'Send me a new password'
      expect(page).to have_content("Email not found")
      
    end
    
    scenario 'Introduce blank email' do
      fill_in 'Email', with: ''
      click_button 'Send me a new password'
      expect(page).to have_content("Email can't be blank")
    end
    
    scenario 'Introduce valid data' do
      fill_in 'Email', with: 'registeredemail@email.com'
      click_button 'Send me a new password'
      expect(current_path).to eql('/users/sign_in')
    end
    
end