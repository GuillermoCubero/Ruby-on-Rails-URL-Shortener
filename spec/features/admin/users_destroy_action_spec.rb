require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Users Destroy Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true) }
  let(:user){ User.create(email:'example@example.com', password: 'example', password_confirmation: 'example') }
  
  before do
    visit root_path
    click_link 'Login'
    login_user(admin.email, "admin123")
    click_link 'Manage Users'
  end

  scenario 'Visit the Users Page' do
    expect(page).to have_title('URL Shortener | See the Users')
  end
  
  scenario 'Destroy a user' do
    fill_in 'term', with: user.email
    click_button 'Search'
    click_link 'Destroy'
    expect(page).to have_content('User was successfully destroyed.')
  end
  
end