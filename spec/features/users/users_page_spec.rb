require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Users Page', :type => :feature do
  
  let(:user) { User.create(email:'registeredemail@email.com', password:'admin123', password_confirmation: 'admin123', 
        admin: true) }
  
  before do
    login_user(user.email, "admin123")
    visit root_path
    click_link 'Manage Users'
  end
  
  scenario 'Visit the Short Url Page' do
    expect(page).to have_title('URL Shortener | See the Users')
  end
  
  scenario 'List all users' do
    expect(page).to have_content('Email: registeredemail@email.com')
    expect(page).to have_content('Admin: true')
    expect(page).to have_selector('tr', count: 2)
  end
  
end