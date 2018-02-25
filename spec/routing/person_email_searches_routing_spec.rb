require "rails_helper"

RSpec.describe PersonEmailSearchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/person_email_searches").to route_to("person_email_searches#index")
    end

    it "routes to #new" do
      expect(:get => "/person_email_searches/new").to route_to("person_email_searches#new")
    end

    it "routes to #show" do
      expect(:get => "/person_email_searches/1").to route_to("person_email_searches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/person_email_searches/1/edit").to route_to("person_email_searches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/person_email_searches").to route_to("person_email_searches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/person_email_searches/1").to route_to("person_email_searches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/person_email_searches/1").to route_to("person_email_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/person_email_searches/1").to route_to("person_email_searches#destroy", :id => "1")
    end

  end
end
