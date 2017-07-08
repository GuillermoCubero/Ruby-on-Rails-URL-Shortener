require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Short Destroy Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true) }
  
  before do
    Short.create(url:'example.com')
    visit root_path
    click_link 'Login'
    login_user(admin.email, "admin123")
    click_link 'URLs'
  end

  scenario 'Visit the Shorts Page' do
    expect(page).to have_title('URL Shortener | See the Shorts')
  end
  
  scenario 'Destroy a url' do
    click_link 'Destroy'
    expect(page).to have_content('Short was successfully destroyed.')
  end
  
end