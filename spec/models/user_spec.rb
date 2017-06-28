require 'rails_helper'

RSpec.describe User, type: :model do
    
    let(:user) { User.create(id: 1, email:'registeredemail@email.com', password:'admin123', password_confirmation:'admin123') }
    
    describe 'email is valid' do
        it 'has email attribute' do
            expect(user.attributes).to include('email')   
        end
            
        %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com].each do |invalid_emails|
            it 'should be invalid email attribute' do
                user.email = invalid_emails
                expect(user).to be_invalid
            end
        end
            
        %w[user@foo.com user_at_foo@algo.org example.user@foo.com foo@bar-baz.com algo-foo@barbaz.com].each do |valid_emails|
            it 'should be valid email attribute' do
                user.email = valid_emails
                expect(user).to be_valid
            end
        end
    end
    
end