require 'rails_helper'
include TestHelper::Features

RSpec.feature 'User Edit Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@example.com', password:'password', password_confirmation: 'password', admin: true) }
  
  before do
    User.create(
    email:'user@example.com', 
    password:'password', 
    password_confirmation: 'password')
    login_user(admin.email, "password")
    visit root_path
    click_link 'Users'
    fill_in 'term', with: 'user@example.com'
    click_button 'Search'
    click_link 'Edit'
  end
  
  scenario 'Visit the Edit Users Page' do
    expect(page).to have_title('URL Shortener | Update User')
  end
  
  scenario 'Edit the shortened url with valid info' do
    fill_in 'Edit user email', with: 'useredited@example.com'
    fill_in 'Password', with: 'password2'
    fill_in 'Password confirmation', with: 'password2'
    click_button 'Update info'
    expect(page).to have_content('User was successfully updated.')
  end
  
  scenario 'Edit the shortened url with invalid info' do
    fill_in 'Edit user email', with: ''
    click_button 'Update info'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    
  end

end