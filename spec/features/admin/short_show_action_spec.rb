require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Short Show Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true) }
  
  before do
    Short.create(url:'example.com')
    visit root_path
    click_link 'Login'
    login_user(admin.email, "admin123")
    click_link 'Manage URLs'
    click_link 'Show'
  end

  scenario 'Visit the Show Info Page' do
    expect(page).to have_title('URL Shortener | Shorts Info')
  end
  
  scenario 'See the shortened url info' do
    expect(page).to have_content('Url: http://example.com')
    expect(page).to have_content('Shorted Url:  http://www.example.com/1')
  end
  
  
end