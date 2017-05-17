require 'rails_helper'

RSpec.feature 'RSpec Test', :type => :feature do
  
  before do
    visit '/'
  end
  
  scenario 'Visit the Short Url Page' do
    expect(page).to have_title('URL shorter')
  end
  
  scenario 'Short a blank URL' do
    fill_in 'Url', with: ''
    click_button 'Create Short'
    expect(page).to have_content("Url can't be blank")
  end
  
  scenario 'Short an invalid URL' do
    fill_in 'Url', with: 'http://urldepruebaquefallará'
    click_button 'Create Short'
    expect(page).to have_content('Url is invalid')
  end
  
  scenario 'Short a valid URL' do
    fill_in 'Url', with: 'https://www.google.com/'
    click_button 'Create Short'
    expect(page).to have_content('Short was successfully created.')
    click_link('id-of-link') # revisar esta parte en el futuro.
    expect(current_url).to eql('https://www.google.com/')
  end
  
end
