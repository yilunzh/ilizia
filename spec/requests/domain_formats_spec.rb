require 'rails_helper'

RSpec.describe "DomainFormats", type: :request do
  describe "GET /domain_formats" do
    it "works! (now write some real specs)" do
      get domain_formats_path
      expect(response).to have_http_status(200)
    end
  end
end
