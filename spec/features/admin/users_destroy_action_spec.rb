require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Users Destroy Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true) }
  
  before do
    User.create(email:'example@example.com', password: 'example', password_confirmation: 'example')
    visit root_path
    click_link 'Login'
    login_user(admin.email, "admin123")
    click_link 'Manage Users'
  end

  scenario 'Visit the Users Page' do
    expect(page).to have_title('URL Shortener | See the Users')
  end
  
  scenario 'Destroy a user' do
    first('btn.btn-info.pull-right').click_button('Destroy')
    expect(page).to have_content('User was successfully destroyed.')
  end
  
end