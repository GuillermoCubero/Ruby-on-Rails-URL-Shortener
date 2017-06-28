require "rails_helper"

RSpec.describe ShortsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/shorts/new").to route_to("shorts#new")
    end

    it "routes to #show" do
      expect(:get => "/shorts/1").to route_to("shorts#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shorts").to route_to("shorts#create")
    end

  end
end
