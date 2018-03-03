require 'rails_helper'

RSpec.describe "domain_formats/new", type: :view do
  before(:each) do
    assign(:domain_format, DomainFormat.new(
      :domain_url => "",
      :format => "",
      :status => "",
      :score => 1
    ))
  end

  it "renders new domain_format form" do
    render

    assert_select "form[action=?][method=?]", domain_formats_path, "post" do

      assert_select "input[name=?]", "domain_format[domain_url]"

      assert_select "input[name=?]", "domain_format[format]"

      assert_select "input[name=?]", "domain_format[status]"

      assert_select "input[name=?]", "domain_format[score]"
    end
  end
end
