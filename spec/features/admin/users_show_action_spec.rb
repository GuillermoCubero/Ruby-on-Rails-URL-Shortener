require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Users Show Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true) }
  
  before do
    Short.create(url:'example.com')
    visit root_path
    click_link 'Login'
    login_user(admin.email, "admin123")
    click_link 'Manage Users'
    click_link 'Show'
  end

  scenario 'Visit the Show Info Page' do
    expect(page).to have_title('URL Shortener | Users Info')
  end
  
  scenario 'See the shortened url info' do
    expect(page).to have_content("Email: #{admin.email}")
    expect(page).to have_content("See your Users information")
  end
  
  
end