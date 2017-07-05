require 'rails_helper'

RSpec.describe AdvertisementsHelper, type: :helper do
    
    let(:user){ User.create!(id: 1, email: 'email@email.com', password: 'password', password_confirmation: 'password', admin: true) }
    
    describe "advert(id)" do
        it "finds an advertisement into the database" do
            advertisement = Advertisement.create!(title: 'Title', user_id: user.id, 
                picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")))
            expect(helper.advert(1).title).to eql(advertisement.title)
        end
    end
    
end
