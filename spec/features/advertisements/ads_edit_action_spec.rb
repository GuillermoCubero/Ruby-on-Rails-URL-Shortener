require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Ads Edit Action', :type => :feature do
  
  let(:user){ User.create(email:'user@example.com', password:'password', password_confirmation: 'password') }
  
  before do
    Advertisement.create(title: 'Anuncio 1', 
    user_id: user.id, 
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")))
    login_user(user.email, "password")
    visit root_path
    click_link 'Ads'
    click_link 'Edit'
  end
  
  scenario 'Visit the Edit Advertisements Page' do
    expect(page).to have_title('URL Shortener | Update Advertisement')
  end
  
  scenario 'Edit the shortened url with valid info' do
    fill_in 'Select a new title for your advertisement', with: 'Title 1'
    page.attach_file('picture', Rails.root + 'app/assets/images/logo.png')
    click_button 'Update advertisement'
    expect(page).to have_content('Advertisement was successfully updated.')
  end
  
  scenario 'Edit the shortened url with invalid info' do
    fill_in 'Select a new title for your advertisement', with: ''
    click_button 'Update advertisement'
    expect(page).to have_content("Title can't be blank")
  end

end