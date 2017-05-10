require 'rails_helper'

RSpec.feature 'RSpec Test', :type => :feature do
  
  scenario 'Visit the Short Url Page' do
    visit '/'
    expect(page).to have_title('URL shorter')
  end
  
  scenario 'Short a blank URL' do
    visit '/'
    fill_in 'User url', with: ''
    click_button 'Create Short'
    expect(page).to have_content("User url can't be blank")
  end
  
  scenario 'Short an invalid URL' do
    visit '/'
    fill_in 'User url', with: 'http://urldepruebaquefallará'
    click_button 'Create Short'
    expect(page).to have_content('User url is invalid')
  end
  
  scenario 'Short a valid URL' do
    visit '/'
    fill_in 'User url', with: 'https://www.google.com'
    click_button 'Create Short'
    expect(page).to have_content('Short was successfully created.')
    click_link('id-of-link') # revisar esta parte en el futuro.
    expect(current_path).to eql('https://www.google.com')
  end
  
end
