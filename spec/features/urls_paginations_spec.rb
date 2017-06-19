require 'rails_helper'
include TestHelper::Features


RSpec.feature 'UrlsPaginations', type: :feature do
    
    before do
        WillPaginate.per_page = 1
        2.times do |n|
          url  = "http://www.url#{n}.com"
          Short.create!(id: n, url: url)
        end
        User.create(email:'admin@admin.com', password:'admin123', password_confirmation: 'admin123', admin: true)
        login_user("admin@admin.com", "admin123")
        visit '/shorts'
    end
    
    scenario 'Pagination is rendered' do
        expect(page).to have_selector('div .pagination')
    end
    
    describe 'Pagination lists all urls' do
        it 'list first page' do
            expect(page).to have_content('http://www.url0.com')
            expect(page).to have_selector('tr', count: 1)
        end
        
        it 'list last page' do
            click_link 'Next'
            expect(page).to have_content('http://www.url1.com')
            expect(page).to have_selector('tr', count: 1)
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
