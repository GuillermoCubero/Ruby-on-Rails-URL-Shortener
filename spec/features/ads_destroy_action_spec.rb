require 'rails_helper'
include TestHelper::Features

RSpec.feature 'Ads Destroy Action', :type => :feature do
  
  let(:user){ User.create(email:'user@example.com', password:'password', password_confirmation: 'password') }
  
  before do
    Advertisement.create(title:  'Anuncio 1', 
    user_id: user.id, 
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")))
    login_user(user.email, "password")
    visit root_path
    click_link 'Manage Advertisements'
  end
  
  scenario 'Visit the Advertisements Page' do
    expect(page).to have_title('URL Shortener | Manage Advertisements')
  end
  
  scenario 'Destroy an advertisement' do
    click_link 'Destroy'
    expect(page).to have_content('Advertisement was successfully destroyed.')
  end

end