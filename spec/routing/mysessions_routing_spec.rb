require "rails_helper"

RSpec.describe MysessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/mysessions").to route_to("mysessions#index")
    end

    it "routes to #new" do
      expect(:get => "/mysessions/new").to route_to("mysessions#new")
    end

    it "routes to #show" do
      expect(:get => "/mysessions/1").to route_to("mysessions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mysessions/1/edit").to route_to("mysessions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mysessions").to route_to("mysessions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mysessions/1").to route_to("mysessions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mysessions/1").to route_to("mysessions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mysessions/1").to route_to("mysessions#destroy", :id => "1")
    end
  end
end
