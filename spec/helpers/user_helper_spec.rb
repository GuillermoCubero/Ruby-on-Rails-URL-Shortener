require 'rails_helper'

RSpec.describe UserHelper, type: :helper do

    describe "user(id)" do
        it "finds an user into the database" do
            user = User.create!(id: 1, email: 'email@email.com', password: 'password', password_confirmation: 'password', admin: true)
            expect(helper.user(1).email).to eql('email@email.com')
        end
    end
    
end