require 'rails_helper'

RSpec.describe UserController, type: :controller do

  let(:valid_attributes) {
    {email:'email@email.com', password:'pass123', password_confirmation:'pass123'}
  }

  let(:invalid_attributes) {
    {email:'email@email.com', password:'pass123', password_confirmation:'pass1234'}
  }

  let(:valid_session) { {} }

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {email:'email@email.com', password:'pass1234', password_confirmation:'pass1234'}
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        expect(user).to be_valid
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, params: {id: user.to_param}, session: valid_session
      expect(response).to redirect_to(user_index_url)
    end
  end

end