require "rails_helper"

RSpec.describe DomainFormatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/domain_formats").to route_to("domain_formats#index")
    end

    it "routes to #new" do
      expect(:get => "/domain_formats/new").to route_to("domain_formats#new")
    end

    it "routes to #show" do
      expect(:get => "/domain_formats/1").to route_to("domain_formats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/domain_formats/1/edit").to route_to("domain_formats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/domain_formats").to route_to("domain_formats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/domain_formats/1").to route_to("domain_formats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/domain_formats/1").to route_to("domain_formats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/domain_formats/1").to route_to("domain_formats#destroy", :id => "1")
    end

  end
end
