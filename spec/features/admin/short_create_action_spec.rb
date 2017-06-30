require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Short Create Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true) }
  
  before do
    visit root_path
    click_link 'Login'
    login_user(admin.email, "admin123")
    click_link 'Manage URLs'
    click_link 'New Short'
  end
  
  scenario 'Visit the Short Url Page' do
    expect(page).to have_title('URL Shortener | Create a Short')
  end
  
  scenario 'Short a blank URL' do
    fill_in 'Introduce an URL to short:', with: ''
    click_button 'Create short'
    expect(page).to have_content("Url is invalid")
  end
  
  scenario 'Short an invalid URL' do
    fill_in 'Introduce an URL to short:', with: 'http://urldepruebaquefallará'
    click_button 'Create short'
    expect(page).to have_content('Url is invalid')
  end
  
  scenario 'Short a valid URL' do
    fill_in 'Introduce an URL to short:', with: 'https://www.google.com/'
    click_button 'Create short'
    expect(page).to have_content('Short was successfully created.')
    click_link('id-of-link')
    expect(current_url).to eql('https://www.google.com/')
  end
  
end