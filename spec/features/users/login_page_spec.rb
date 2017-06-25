require 'rails_helper'

RSpec.feature 'Login Page', :type => :feature do
  
  let(:user) { User.create(email:'registeredemail@email.com', password:'password', password_confirmation: 'password') }
  
  before do
    visit root_path
    click_link 'Login'
  end
  
  scenario 'Visit the Login Page' do
    expect(page).to have_title('URL Shortener | Login')
  end
  
  scenario 'Access with valid parameters' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
  end
  
  scenario 'Access with invalid parameters' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password2'
    click_button 'Log in'
    expect(page).to have_content("Invalid Email or password.")
  end
  
  scenario 'Login with remember me' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_link("Logout")
    expire_cookies
    expect(page).to have_link("Logout")
  end
  
end