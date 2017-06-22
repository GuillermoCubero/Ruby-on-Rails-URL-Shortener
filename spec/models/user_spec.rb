require 'rails_helper'

RSpec.describe User, type: :model do
    
    let(:user) { User.create(id: 1, email:'registeredemail@email.com', password:'admin123', password_confirmation:'admin123', admin: true) }
    
    subject { user }
     
    it { should respond_to(:email) }
    it { should respond_to(:encrypted_password) }
    it { should respond_to(:reset_password_token) }
    it { should respond_to(:reset_password_sent_at) }
    it { should respond_to(:remember_created_at) }
    it { should respond_to(:sign_in_count) }
    it { should respond_to(:current_sign_in_at) }
    it { should respond_to(:last_sign_in_at) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
    it { should respond_to(:admin) }
    it { should be_valid }
    
    context 'User is autenticable' do
        
        it 'has valid email' do
            expect(user).to eql(User.find_for_database_authentication(email:'registeredemail@email.com'))
        end
        
        it 'has valid password' do
            expect(user.valid_password?('admin123')).to be true
        end
        
    end
    
    context 'User is registerable' do
        
        it 'has valid attributes' do
            expect(user).to be_valid
        end
        
        it 'not valid with invalid attributes' do
            user.email = ''
            expect(user).to be_invalid
        end
        
    end
    
    context 'User is recoverable' do
        
        it 'can send password instructions' do
            expect(user.reset_password_period_valid?).to eql(nil)
            user.send_reset_password_instructions
            expect(user.reset_password_period_valid?).to be true
        end
        
         it 'can reset password' do
            user.reset_password('password123', 'password123')
            expect(user.valid_password?('password123')).to be true
        end
        
    end
    
    
    context 'User is rememberable' do
        
        it 'can remember an user' do
            expect(user.remember_created_at).to eql(nil)
            expect(user.remember_me!).to be true
        end
        
        it 'have remember_created_at attribute' do
            user.remember_me!
            expect(user.remember_created_at).not_to eql(nil)
        end
        
        it 'can forget an user' do
            expect(user.remember_me!).to be true
            user.forget_me!
            expect(user.remember_created_at).to eql(nil)
        end
        
    end
    
    context 'User is trackable' do
        %w[sign_in_count last_sign_in_at current_sign_in_at last_sign_in_ip current_sign_in_ip].each do |trackable_attributes|
            it 'has trackable attributes' do
                expect(user.attributes).to include(trackable_attributes)
            end
        end
    end
    
    context 'User is validatable' do
        
        describe 'password is valid' do
            it 'password has minimum length' do
                #no se como probar esta parte
            end
            
            it 'has password attribute' do
                expect(user.attributes).to include('encrypted_password')
            end
        end
        
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
    
end
