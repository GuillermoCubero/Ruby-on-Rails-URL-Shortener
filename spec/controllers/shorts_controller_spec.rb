require 'rails_helper'

RSpec.describe ShortsController, type: :controller do

  let(:valid_attributes) {
    {id: 1, url: 'http://algo.com'}
  }

  let(:invalid_attributes) {
    {id:1 , url: ''}
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested short as @short" do
      short = Short.create! valid_attributes
      get :show, params: {id: short.to_param}, session: valid_session
      expect(assigns(:short)).to eq(short)
    end
  end

  describe "GET #new" do
    it "assigns a new short as @short" do
      get :new, params: {}, session: valid_session
      expect(assigns(:short)).to be_a_new(Short)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Short" do
        expect {
          post :create, params: {short: valid_attributes}, session: valid_session
        }.to change(Short, :count).by(1)
      end

      it "assigns a newly created short as @short" do
        post :create, params: {short: valid_attributes}, session: valid_session
        expect(assigns(:short)).to be_a(Short)
        expect(assigns(:short)).to be_persisted
      end

      it "redirects to the home page" do
        post :create, params: {short: valid_attributes}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved short as @short" do
        post :create, params: {short: invalid_attributes}, session: valid_session
        expect(assigns(:short)).to be_a_new(Short)
      end

      it "re-renders the 'new' template" do
        post :create, params: {short: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
