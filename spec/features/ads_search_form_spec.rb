require 'rails_helper'
include TestHelper::Features

RSpec.feature 'RSpec Test', :type => :feature do
  
  let(:user) { User.create(email:'registeredemail@email.com', password:'password', password_confirmation: 'password') }
  
  before do
    2.times do |n|
      title = "Anuncio #{n}"
      picture = File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
      Advertisement.create!(id: n, title: title, user_id: user.id, picture: picture)
    end
    login_user(user.email, "password")
    visit root_path
    click_link 'Manage Advertisements'
  end
      
  scenario 'Visit the Advertisements Page' do
    expect(page).to have_title('URL Shortener | Manage Advertisements')
  end
  
  scenario 'Search and find an advertisement' do
    fill_in 'term', with: 'Anuncio 1'
    click_button 'Search'
    expect(page).to have_content("Title: Anuncio 1")
  end
  
  scenario 'Search and not find any other advertisement' do
    fill_in 'term', with: 'Anuncio 1'
    click_button 'Search'
    expect(page).to have_content("Title: Anuncio 1")
    expect(page).to_not have_content("Title: Anuncio 0")
  end
  
end