require 'rails_helper'

RSpec.feature 'Login Page', :type => :feature do
  
  before do
    User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true)
    visit '/users/sign_in'
  end
  
  scenario 'Visit the Login Page' do
    expect(page).to have_title('URL Shortener | Login')
  end
  
  scenario 'Access with valid parameters' do
    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Password', with: 'admin123'
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
  end
  
  scenario 'Access with invalid parameters' do
    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Password', with: 'admin1234'
    click_button 'Log in'
    expect(current_path).to eql('/users/sign_in')
  end
  
  scenario 'Login with remember me' do
    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Password', with: 'admin123'
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_link("Logout")
    expire_cookies
    expect(page).to have_link("Logout")
  end
  
end