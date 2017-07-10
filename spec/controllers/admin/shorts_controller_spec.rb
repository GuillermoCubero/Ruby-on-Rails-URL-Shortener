require "rails_helper"

RSpec.describe Admin::ShortsController, type: :controller do
  let(:user) { User.create(email:'email@email.com', password:'password', password_confirmation:'password') }
  let(:admin) { User.create(email:'admin@email.com', password:'password', password_confirmation:'password', admin: true) }
  let(:valid_attributes) {
    {id: 1, url: 'http://algo.com'}
  }
  let(:valid_session) { {} }

  context 'non-admin users' do
    it 'are not able to access the index action'do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:authenticate_user!)
      get :index
      expect(response).to redirect_to "/"
      expect(flash[:alert]).to eq "Need to be administrator for this."
    end
  end
  
  context 'admin users' do
    
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      allow(controller).to receive(:authenticate_user!)
    end
    
    describe "GET #index" do
      it "returns a success response" do
        short = Short.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end
    
    describe "DELETE #destroy" do
      it "destroys the requested short" do
        short = Short.create! valid_attributes
        expect {
          delete :destroy, params: {id: short.to_param}, session: valid_session
        }.to change(Short, :count).by(-1)
      end
  
      it "redirects to the short list" do
        short = Short.create! valid_attributes
        delete :destroy, params: {id: short.to_param}, session: valid_session
        expect(response).to redirect_to(admin_shorts_url)
      end
    end
    
  end
  
end