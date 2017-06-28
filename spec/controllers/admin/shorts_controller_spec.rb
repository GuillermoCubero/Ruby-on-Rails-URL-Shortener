require "rails_helper"

RSpec.describe Admin::ShortsController, type: :controller do
  let(:user) { User.create(email:'email@email.com', password:'password', password_confirmation:'password') }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:authenticate_user!)
  end

  context "non-admin users" do
    it "are not able to access the index action" do
      get :index

      expect(response).to redirect_to "/"
      expect(flash[:alert]).to eq "Need to be administrator for this."
    end
  end
end