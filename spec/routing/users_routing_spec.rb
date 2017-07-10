require "rails_helper"

RSpec.describe Admin::UserController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/user").to route_to("admin/user#index")
    end

    it "routes to #show" do
      expect(:get => "/admin/user/1").to route_to("admin/user#show", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/user/1").to route_to("admin/user#destroy", :id => "1")
    end
    
    it "routes to #edit" do
      expect(:get => "/admin/user/1/edit").to route_to("admin/user#edit", :id => "1")
    end
    
    it "routes to #update via PUT" do
      expect(:put => "/admin/user/1").to route_to("admin/user#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/user/1").to route_to("admin/user#update", :id => "1")
    end

  end
end
