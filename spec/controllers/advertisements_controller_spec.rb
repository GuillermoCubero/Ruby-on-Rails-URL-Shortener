require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:user){ User.create(email: 'validemail@example.com', password: 'password', password_confirmation: 'password') }

  let(:valid_attributes) {
    {title:"Anuncio 1", user_id: user.id, picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")) }
  }

  let(:invalid_attributes) {
    {title:"Anuncio 1", picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")), user_id: 2}
  }

  let(:valid_session) { {} }
  
  before do
    allow(controller).to receive(:current_user).and_return(user)
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

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      advertisement = Advertisement.create! valid_attributes
      get :edit, params: {id: advertisement.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Advertisement" do
        expect {
          post :create, params: {advertisement: valid_attributes}, session: valid_session}
          expect(response).to be_success
      end

      it "redirects to advertisements path" do
        post :create, params: {advertisement: valid_attributes}, session: valid_session
        expect(request.fullpath).to eq(advertisements_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {advertisement: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title:"Anuncio 2", user_id: user.id, picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png")) }
      }

      it "updates the requested advertisement" do
        advertisement = Advertisement.create! valid_attributes
        put :update, params: {id: advertisement.to_param, advertisement: new_attributes}, session: valid_session
        advertisement.reload
        expect(advertisement.title).to eq("Anuncio 1")
      end

      it "redirects to the advertisement" do
        advertisement = Advertisement.create! valid_attributes
        put :update, params: {id: advertisement.to_param, advertisement: valid_attributes}, session: valid_session
        expect(request.fullpath).to eq(advertisement_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        advertisement = Advertisement.create! valid_attributes
        put :update, params: {id: advertisement.to_param, advertisement: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
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
      expect(response).to redirect_to(advertisements_url)
    end
  end

end
