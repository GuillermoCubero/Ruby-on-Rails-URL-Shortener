require 'rails_helper'
include TestHelper::Features


RSpec.feature 'UsersPaginations', type: :feature do
    
  let(:user) { User.create(email:'registeredemail@email.com', password:'password', password_confirmation: 'password') }

    before do
      5.times do |n|
        WillPaginate.per_page = 4
        title = "Anuncio #{n}"
        picture = File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
        Advertisement.create!(id: n, title: title, user_id: user.id, picture: picture)
      end
        login_user(user.email, "password")
        visit root_path
        click_link 'Ads'
    end
    
    scenario 'Pagination is rendered' do
        expect(page).to have_selector('div .pagination')
    end
    
    describe 'Pagination lists all advertisements' do
        it 'list first page' do
            expect(page).to have_content('Anuncio 4')
            expect(page).to have_content('Anuncio 1')
            expect(page).to have_selector('tr', count: 5)
        end
        
        it 'list last page' do
            click_link 'Next'
            expect(page).to have_content('Anuncio 0')
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
