require 'rails_helper'

RSpec.feature "Signup Page", type: :feature do
  
  before do
    User.create(email:'registeredemail@email.com', password:'admin123', password_confirmation: 'admin123', admin: true)
    visit '/users/sign_up'
  end
  
  scenario 'Visit the Signup Page' do
    expect(page).to have_title('URL Shortener | Sign up')
  end
  
  describe 'Invalid registrations' do
    scenario 'Introduce blank data' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
      click_button 'Sign up'
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
      
    scenario 'Introduce a short password' do
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'
      click_button 'Sign up'
      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end
      
    scenario 'Introduce a registered email' do
      fill_in 'Email', with: 'registeredemail@email.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'
      expect(page).to have_content("Email has already been taken")
    end
      
    scenario 'Introduce diferent passwords' do
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '1234567'
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
    
  describe 'Valid registration' do
    scenario 'Introduce valid data' do
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: '1234567'
      fill_in 'Password confirmation', with: '1234567'
      click_button 'Sign up'
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end
end