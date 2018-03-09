require 'rails_helper'

RSpec.describe "SearchResults", type: :request do
  describe "GET /search_results" do
    it "works! (now write some real specs)" do
      get search_results_path
      expect(response).to have_http_status(200)
    end
  end
end
