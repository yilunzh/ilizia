require "rails_helper"

RSpec.describe EmailFormatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/email_formats").to route_to("email_formats#index")
    end

    it "routes to #new" do
      expect(:get => "/email_formats/new").to route_to("email_formats#new")
    end

    it "routes to #show" do
      expect(:get => "/email_formats/1").to route_to("email_formats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/email_formats/1/edit").to route_to("email_formats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/email_formats").to route_to("email_formats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/email_formats/1").to route_to("email_formats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/email_formats/1").to route_to("email_formats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/email_formats/1").to route_to("email_formats#destroy", :id => "1")
    end

  end
end
