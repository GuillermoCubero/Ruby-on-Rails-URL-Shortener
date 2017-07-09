require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Ads Show Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@example.com', password:'password', password_confirmation: 'password', admin:true) }
  
  before do
    Advertisement.create(title: 'Anuncio 1', 
    user_id: admin.id, 
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")))
    login_user(admin.email, "password")
    visit root_path
    click_link 'Ads'
    click_link 'Show'
  end
  
  scenario 'Visit the Show Advertisements Page' do
    expect(page).to have_title('URL Shortener | Advertisements Info')
  end
  
  scenario 'See the advertisement info' do
    expect(page).to have_content("Owner: #{admin.email}")
    expect(page).to have_content("Advertisement title: Anuncio 1")
    expect(page).to have_content("See your Advertisements information")
  end

end