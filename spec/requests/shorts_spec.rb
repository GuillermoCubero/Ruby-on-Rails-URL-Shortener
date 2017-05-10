require 'rails_helper'

RSpec.describe "Shorts", type: :request do
  describe "GET /shorts" do
    it "works! (now write some real specs)" do
      get shorts_path
      expect(response).to have_http_status(200)
    end
  end
end
