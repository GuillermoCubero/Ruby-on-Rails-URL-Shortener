require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Short Search', :type => :feature do
  
  let(:admin) { User.create(email:'admin@email.com', password:'password', password_confirmation: 'password', admin: true) }
  
  before do
    2.times do |n|
      url = "url#{n}.com"
      Short.create!(id: n, url: url)
    end
    login_user(admin.email, "password")
    visit root_path
    click_link 'URLs'
  end
      
  scenario 'Visit the Urls Page' do
    expect(page).to have_title('URL Shortener | See the Shorts')
  end
  
  scenario 'Search and find an url' do
    fill_in 'term', with: 'url1.com'
    click_button 'Search'
    expect(page).to have_selector('td', text: "http://url1.com")
  end
  
  scenario 'Search and not find any other url' do
    fill_in 'term', with: 'url1.com'
    click_button 'Search'
    expect(page).to have_selector('td', text: "http://url1.com")
    expect(page).to_not have_selector('td', text: "http://url0.com")
  end
  
end