require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Ads Create Action', :type => :feature do
  
  let(:user){ User.create(email:'user@example.com', password:'password', password_confirmation: 'password') }
  
  before do
    login_user(user.email, "password")
    visit root_path
  end
  
  scenario 'Visit the Advertisements Page' do
    expect(page).to have_title('URL Shortener | Home')
  end
  
  scenario 'Create an advertisement with blank data' do
    fill_in 'Introduce a title for your advertisement:', with: ''
    click_button 'Create advertisement'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Picture can't be blank")
  end
  
  scenario 'Create an advertisement with invalid image size' do
    fill_in 'Introduce a title for your advertisement:', with: 'Title 1'
    page.attach_file('picture', Rails.root + 'app/assets/images/big-image.jpg')
    click_button 'Create advertisement'
    expect(page).to have_content("Picture should be less than 5MB.")
  end
  
  scenario 'Create a valid advertisement' do
    fill_in 'Introduce a title for your advertisement:', with: 'Title 1'
    page.attach_file('picture', Rails.root + 'app/assets/images/logo.png') 
    click_button 'Create advertisement'
    expect(page).to have_content('Advertisement was successfully created.')
  end

end