require "rails_helper"

RSpec.describe MyregistrationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/myregistrations").to route_to("myregistrations#index")
    end

    it "routes to #new" do
      expect(:get => "/myregistrations/new").to route_to("myregistrations#new")
    end

    it "routes to #show" do
      expect(:get => "/myregistrations/1").to route_to("myregistrations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/myregistrations/1/edit").to route_to("myregistrations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/myregistrations").to route_to("myregistrations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/myregistrations/1").to route_to("myregistrations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/myregistrations/1").to route_to("myregistrations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/myregistrations/1").to route_to("myregistrations#destroy", :id => "1")
    end
  end
end
