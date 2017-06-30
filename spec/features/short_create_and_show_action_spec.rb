require 'rails_helper'

RSpec.feature 'Short Create Action', :type => :feature do
  
  before do
    visit root_path
  end
  
  scenario 'Visit the Short Url Page' do
    expect(page).to have_title('URL Shortener | Home')
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
  
  scenario 'See the shortened url info' do
    fill_in 'Introduce an URL to short:', with: 'https://www.google.com/'
    click_button 'Create short'
    expect(page).to have_content('Url: https://www.google.com/')
    expect(page).to have_content('Shorted Url:  http://www.example.com/1')
  end
end