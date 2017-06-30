require 'rails_helper'
include TestHelper::Features


RSpec.feature 'UsersPaginations', type: :feature do
    
    before do
        WillPaginate.per_page = 4
        5.times do |n|
          email = "email#{n}@email.com"
          password = "password"
          password_confirmation = "password"
          User.create!(id: n, email: email, password: password, password_confirmation: password_confirmation, admin: true)
        end
        login_user("email1@email.com", "password")
        visit root_path
        click_link 'Manage Users'
    end
    
    scenario 'Pagination is rendered' do
        expect(page).to have_selector('div .pagination')
    end
    
    describe 'Pagination lists all urls' do
        it 'list first page' do
            expect(page).to have_content('email4@email.com')
            expect(page).to have_content('email1@email.com')
            expect(page).to have_selector('tr', count: 5)
        end
        
        it 'list last page' do
            click_link 'Next'
            expect(page).to have_content('email0@email.com')
            expect(page).to have_selector('tr', count: 2)
        end
    end
    
    describe 'Pagination works propertly' do
        it 'pagination is in the current page' do
            expect(page).to have_selector('li', text:1)
            click_link 'Next'
            expect(page).to have_selector('li', text:2)
        end
        
        it 'cant paginate next-page from the last page' do
            click_link 'Next'
            expect(page).to have_selector('li.next.next_page.disabled')
        end
        
        it 'cant paginate prev-page from the first page' do
            click_link 'Previous'
            expect(page).to have_selector('li.prev.previous_page.disabled')
        end
        
        it 'pagination-next and pagination-prev is rendered' do
            expect(page).to have_selector('li', text:"Next")
            expect(page).to have_selector('li', text:"Previous")
        end
    end
end
