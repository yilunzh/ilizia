require 'rails_helper'

RSpec.describe "domain_email_formats/edit", type: :view do
  before(:each) do
    @domain_email_format = assign(:domain_email_format, DomainEmailFormat.create!(
      :format => "",
      :confirmed => "",
      :status => "",
      :score => 1
    ))
  end

  it "renders the edit domain_email_format form" do
    render

    assert_select "form[action=?][method=?]", domain_email_format_path(@domain_email_format), "post" do

      assert_select "input[name=?]", "domain_email_format[format]"

      assert_select "input[name=?]", "domain_email_format[confirmed]"

      assert_select "input[name=?]", "domain_email_format[status]"

      assert_select "input[name=?]", "domain_email_format[score]"
    end
  end
end
