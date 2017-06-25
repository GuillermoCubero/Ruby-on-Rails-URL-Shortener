require 'rails_helper'

RSpec.feature "ForgotPassword Page", type: :feature do
    
    let(:user){ User.create(email:'registeredemail@email.com', password:'password', password_confirmation: 'password') }
    
    before do
      visit root_path
      click_link 'Login'
      click_link 'Request a new one'
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
    
    describe 'Introduce valid data' do
      
      before do 
        fill_in 'Email', with: user.email
        click_button 'Send me a new password'
      end
      
      it 'redirect to the correct path' do
        expect(current_path).to eql('/users/sign_in')
      end
      
      it 'renders a notification message' do
        expect(page).to have_content("You will receive an email with instructions on how to reset your password in a few minutes.")
      end
      
      it 'has sent a correct reset mail' do
        email = ActionMailer::Base.deliveries.last
        expect(email.to[0]).to eql(user.email)
        expect(email.subject).to eql ('Reset password instructions')
      end
      
    end
    
end