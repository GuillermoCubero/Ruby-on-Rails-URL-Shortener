require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Ads Destroy Action', :type => :feature do
  
  let(:admin){ User.create(email:'admin@example.com', password:'password', password_confirmation: 'password', admin: true) }
  
  before do
    Advertisement.create(title:  'Anuncio 1', 
    user_id: admin.id, 
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")))
    login_user(admin.email, "password")
    visit root_path
    click_link 'Ads'
  end
  
  scenario 'Visit the Advertisements Page' do
    expect(page).to have_title('URL Shortener | See the Advertisements')
  end
  
  scenario 'Destroy an advertisement' do
    click_link 'Destroy'
    expect(page).to have_content('Advertisement was successfully destroyed.')
  end

end