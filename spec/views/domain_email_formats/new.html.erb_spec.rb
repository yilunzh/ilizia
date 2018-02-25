require 'rails_helper'

RSpec.describe "domain_email_formats/new", type: :view do
  before(:each) do
    assign(:domain_email_format, DomainEmailFormat.new(
      :format => "",
      :confirmed => "",
      :status => "",
      :score => 1
    ))
  end

  it "renders new domain_email_format form" do
    render

    assert_select "form[action=?][method=?]", domain_email_formats_path, "post" do

      assert_select "input[name=?]", "domain_email_format[format]"

      assert_select "input[name=?]", "domain_email_format[confirmed]"

      assert_select "input[name=?]", "domain_email_format[status]"

      assert_select "input[name=?]", "domain_email_format[score]"
    end
  end
end
