require 'rails_helper'

RSpec.feature "ResetPassword Page", type: :feature do
    
    let(:user) { User.create(email:'registeredemail@email.com', password:'admin123', password_confirmation: 'admin123', 
        admin: true) }
    
    before do
      visit  new_user_password_path
      fill_in "Email", with: user.email
      click_button "Send me a new password"
      open_email(user.email)
      current_email.click_link 'Change my password'
    end
    
    scenario 'Visit the Reset Password Page' do
      expect(page).to have_title('URL Shortener | Change Password')
    end
    
    scenario 'Introduce a invalid password' do
      fill_in "New password", with: 'asd'
      fill_in "Confirm new password", with: 'asd'
      click_button 'Change my password'
      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end
    
    scenario 'Introduce different passwords' do
      fill_in "New password", with: 'password1'
      fill_in "Confirm new password", with: 'password2'
      click_button 'Change my password'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
    
    scenario 'Introduce valid password' do
      fill_in "New password", with: 'password'
      fill_in "Confirm new password", with: 'password'
      click_button 'Change my password'
      expect(page).to have_content("Your password has been changed successfully. You are now signed in.")
    end
    
end