require 'rails_helper'

RSpec.describe "EmailFormats", type: :request do
  describe "GET /email_formats" do
    it "works! (now write some real specs)" do
      get email_formats_path
      expect(response).to have_http_status(200)
    end
  end
end
