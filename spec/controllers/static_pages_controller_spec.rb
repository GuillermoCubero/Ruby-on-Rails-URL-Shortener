require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  let(:user){ User.create(email: 'validemail@example.com', password: 'password', password_confirmation: 'password') }

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
  
  
  describe "GET #welcome" do
    it "returns http success" do
      allow(controller).to receive(:current_user).and_return(user)
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

end
