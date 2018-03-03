require 'rails_helper'

RSpec.describe "PersonSearches", type: :request do
  describe "GET /person_searches" do
    it "works! (now write some real specs)" do
      get person_searches_path
      expect(response).to have_http_status(200)
    end
  end
end
