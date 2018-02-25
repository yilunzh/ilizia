require 'rails_helper'

RSpec.describe "DomainEmailFormats", type: :request do
  describe "GET /domain_email_formats" do
    it "works! (now write some real specs)" do
      get domain_email_formats_path
      expect(response).to have_http_status(200)
    end
  end
end
