require "rails_helper"

RSpec.describe SearchResultsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/search_results").to route_to("search_results#index")
    end

    it "routes to #new" do
      expect(:get => "/search_results/new").to route_to("search_results#new")
    end

    it "routes to #show" do
      expect(:get => "/search_results/1").to route_to("search_results#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/search_results/1/edit").to route_to("search_results#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/search_results").to route_to("search_results#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/search_results/1").to route_to("search_results#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/search_results/1").to route_to("search_results#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/search_results/1").to route_to("search_results#destroy", :id => "1")
    end

  end
end
