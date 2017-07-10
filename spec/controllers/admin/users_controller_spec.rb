require 'rails_helper'

RSpec.describe Admin::UserController, type: :controller do

  let(:admin){ User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true) }
  let(:valid_attributes) {
    { email: 'example@example.com', password: 'password', password_confirmation: 'password' }
  }
  
  before do
    allow(controller).to receive(:current_user).and_return(admin)
    allow(controller).to receive(:authenticate_user!)
  end
  
  describe "GET #index" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :show, params: {id: user.to_param}
      expect(response).to be_success
    end
  end


  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, params: {id: user.to_param}
      expect(response).to redirect_to(admin_user_index_url)
    end
  end
  
  describe "GET #edit" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :edit, params: {id: user.to_param}
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { email: 'example2@example.com', password: 'password', password_confirmation: 'password' }
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: new_attributes}
        user.reload
        expect(user.email).to eq('example2@example.com')
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: valid_attributes}
        expect(request.fullpath).to eq(admin_user_path)
      end
    end

  end
end