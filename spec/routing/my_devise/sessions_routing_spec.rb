require "rails_helper"

RSpec.describe MyDevise::SessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/my_devise/sessions").to route_to("my_devise/sessions#index")
    end

    it "routes to #new" do
      expect(:get => "/my_devise/sessions/new").to route_to("my_devise/sessions#new")
    end

    it "routes to #show" do
      expect(:get => "/my_devise/sessions/1").to route_to("my_devise/sessions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/my_devise/sessions/1/edit").to route_to("my_devise/sessions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/my_devise/sessions").to route_to("my_devise/sessions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/my_devise/sessions/1").to route_to("my_devise/sessions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/my_devise/sessions/1").to route_to("my_devise/sessions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/my_devise/sessions/1").to route_to("my_devise/sessions#destroy", :id => "1")
    end
  end
end
