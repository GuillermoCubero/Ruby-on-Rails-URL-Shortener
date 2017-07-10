require "rails_helper"

RSpec.describe Admin::AdminAdvertisementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "admin/admin_advertisements").to route_to("admin/admin_advertisements#index")
    end

    it "routes to #show" do
      expect(:get => "admin/admin_advertisements/1").to route_to("admin/admin_advertisements#show", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "admin/admin_advertisements/1").to route_to("admin/admin_advertisements#destroy", :id => "1")
    end

  end
end
