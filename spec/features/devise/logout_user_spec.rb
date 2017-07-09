require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Logout user', :type => :feature do
  
  let(:user) { User.create(email:'registeredemail@email.com', password:'password', password_confirmation: 'password') }
  
  before do
    visit root_path
    click_link 'Login'
    login_user(user.email, 'password')
  end
  
  scenario 'User Logout' do
    visit "/"
    click_link "Logout"
    expect(page).to have_content "Signed out successfully."
  end
  
  
end