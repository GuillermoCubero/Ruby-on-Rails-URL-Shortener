require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Short Edit Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true) }
  
  before do
    Short.create(url:'example.com')
    visit root_path
    click_link 'Login'
    login_user(admin.email, "admin123")
    click_link 'Manage URLs'
    click_link 'Edit'
  end

  scenario 'Visit the Edit Info Page' do
    expect(page).to have_title('URL Shortener | Update Short Info')
  end
  
  scenario 'Edit the shortened url with valid info' do
    fill_in  'Your URL to edit', with: 'www.example.com'
    click_button 'Update short'
    expect(page).to have_content('Short was successfully updated.')
  end
  
  scenario 'Edit the shortened url with invalid info' do
    fill_in  'Your URL to edit', with: 'www.example'
    click_button 'Update short'
    expect(page).to have_content('Url is invalid')
  end
  
  
end