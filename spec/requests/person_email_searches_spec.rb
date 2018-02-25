require 'rails_helper'

RSpec.describe "PersonEmailSearches", type: :request do
  describe "GET /person_email_searches" do
    it "works! (now write some real specs)" do
      get person_email_searches_path
      expect(response).to have_http_status(200)
    end
  end
end
