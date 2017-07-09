require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Ads Search', :type => :feature do
  
  let(:admin) { User.create(email:'admin@email.com', password:'password', password_confirmation: 'password', admin: true) }
  
  before do
    2.times do |n|
      title = "Anuncio #{n}"
      picture = File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
      Advertisement.create!(id: n, title: title, user_id: admin.id, picture: picture)
    end
    login_user(admin.email, "password")
    visit root_path
    click_link 'Ads'
  end
      
  scenario 'Visit the Advertisements Page' do
    expect(page).to have_title('URL Shortener | See the Advertisements')
  end
  
  scenario 'Search and find an advertisement' do
    fill_in 'term', with: 'Anuncio 1'
    click_button 'Search'
    expect(page).to have_selector('td', text: "Anuncio 1")
  end
  
  scenario 'Search and not find any other advertisement' do
    fill_in 'term', with: 'Anuncio 1'
    click_button 'Search'
    expect(page).to have_selector('td', text: "Anuncio 1")
    expect(page).to_not have_selector('td', text: "Anuncio 0")
  end
  
end