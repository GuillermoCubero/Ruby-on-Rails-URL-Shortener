require 'rails_helper'
include TestHelper::Features

RSpec.feature "Edit Profile Page", type: :feature do
  
    let(:user) { User.create(email:'registeredemail@email.com', password:'password', 
      password_confirmation: 'password') }
    let(:user2) { User.create(email:'registeredemail2@email.com', password:'password', 
      password_confirmation: 'password') }
  
  before do
    visit root_path
    click_link "Login"
    login_user(user.email, 'password')
    click_link "Profile"
  end
  
  scenario 'Visit the profile Page' do
    expect(page).to have_title('URL Shortener | Profile')
  end
  
  describe 'Invalid updates' do
    scenario 'Introduce blank data' do
      fill_in 'Name', with: ''
      fill_in 'Company', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
      fill_in 'Current password', with: ''
      click_button 'Update'
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Current password can't be blank")
    end
      
    scenario 'Introduce a short password' do
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'
      fill_in 'Current password', with: 'password'
      click_button 'Update'
      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end
      
    scenario 'Introduce a registered email' do
      fill_in 'Email', with: user2.email
      fill_in 'Current password', with: 'password'
      click_button 'Update'
      expect(page).to have_content("Email has already been taken")
    end
      
    scenario 'Introduce diferent passwords' do
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '1234567'
      fill_in 'Current password', with: 'password'
      click_button 'Update'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
    
  describe 'Valid registration' do
    scenario 'Introduce valid data' do
      fill_in 'Name', with: 'User'
      fill_in 'Company', with: 'User Company'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: '1234567'
      fill_in 'Password confirmation', with: '1234567'
      fill_in 'Current password', with: 'password'
      click_button 'Update'
      expect(page).to have_content("Your account has been updated successfully.")
    end
  end
end