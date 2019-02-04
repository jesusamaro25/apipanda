require "rails_helper"

RSpec.describe FollowedsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/followeds").to route_to("followeds#index")
    end

    it "routes to #show" do
      expect(:get => "/followeds/1").to route_to("followeds#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/followeds").to route_to("followeds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/followeds/1").to route_to("followeds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/followeds/1").to route_to("followeds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/followeds/1").to route_to("followeds#destroy", :id => "1")
    end
  end
end
