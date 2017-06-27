require 'rails_helper'

RSpec.describe UserController, type: :controller do

  let(:valid_attributes) {
    {email:'email@email.com', password:'pass123', password_confirmation:'pass123'}
  }

  let(:invalid_attributes) {
    {email:'email@email.com', password:'pass123', password_confirmation:'pass1234'}
  }

  let(:valid_session) { {} }


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