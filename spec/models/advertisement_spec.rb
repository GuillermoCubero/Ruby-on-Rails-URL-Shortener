require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  
  let(:user){ User.create(email:'user@example.com', password:'password', password_confirmation: 'password') }
  let(:advertisement){ Advertisement.create!(title: 'Title', user_id: user.id, 
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))) }
  
  subject { advertisement }
  
  it { should respond_to(:user_id) }
  it { should respond_to(:picture) }
  it { should respond_to(:title) }
  it { should respond_to(:picture_size) }
  it { should be_valid }
  
  context 'picture size method' do
    
    it 'has upload a correct image' do
      expect(advertisement).to be_valid
    end
    
  end
 
end
