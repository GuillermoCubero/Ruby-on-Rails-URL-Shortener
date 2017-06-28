require 'rails_helper'

RSpec.feature 'RSpec Test', :type => :feature do
  
  before do
    2.times do |n|
      email = "email#{n}@email.com"
      password = "password"
      password_confirmation = "password"
      User.create!(id: n, email: email, password: password, password_confirmation: password_confirmation, admin: true)
    end
    login_user("email0@email.com", "password")
    visit root_path
    click_link 'Manage Users'
  end
      
  scenario 'Visit the Manage Users Page' do
    expect(page).to have_title('URL Shortener | See the Users')
  end
  
  scenario 'Search and find an user' do
    fill_in 'term', with: 'email1@email.com'
    click_button 'Search'
    expect(page).to have_content("Email: email1@email.com")
  end
  
  scenario 'Search and not find any other users' do
    fill_in 'term', with: 'email1@email.com'
    click_button 'Search'
    expect(page).to_not have_content("Email: email0@email.com")
  end
  
end