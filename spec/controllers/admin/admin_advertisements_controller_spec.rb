require 'rails_helper'

RSpec.describe Admin::AdminAdvertisementsController, type: :controller do

  let(:admin){ User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true) }

  let(:valid_attributes) {
    {title:"Anuncio 1", user_id: admin.id, picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")) }
  }

  let(:valid_session) { {} }
  
  before do
    allow(controller).to receive(:current_user).and_return(admin)
    allow(controller).to receive(:authenticate_user!)
  end
  
  describe "GET #index" do
    it "returns a success response" do
      advertisement = Advertisement.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      advertisement = Advertisement.create! valid_attributes
      get :show, params: {id: advertisement.to_param}, session: valid_session
      expect(response).to be_success
    end
  end


  describe "DELETE #destroy" do
    it "destroys the requested advertisement" do
      advertisement = Advertisement.create! valid_attributes
      expect {
        delete :destroy, params: {id: advertisement.to_param}, session: valid_session
      }.to change(Advertisement, :count).by(-1)
    end

    it "redirects to the advertisements list" do
      advertisement = Advertisement.create! valid_attributes
      delete :destroy, params: {id: advertisement.to_param}, session: valid_session
      expect(response).to redirect_to(admin_admin_advertisements_url)
    end
  end

end