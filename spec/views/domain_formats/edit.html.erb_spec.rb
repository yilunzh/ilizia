require 'rails_helper'

RSpec.describe "domain_formats/edit", type: :view do
  before(:each) do
    @domain_format = assign(:domain_format, DomainFormat.create!(
      :domain_url => "",
      :format => "",
      :status => "",
      :score => 1
    ))
  end

  it "renders the edit domain_format form" do
    render

    assert_select "form[action=?][method=?]", domain_format_path(@domain_format), "post" do

      assert_select "input[name=?]", "domain_format[domain_url]"

      assert_select "input[name=?]", "domain_format[format]"

      assert_select "input[name=?]", "domain_format[status]"

      assert_select "input[name=?]", "domain_format[score]"
    end
  end
end
