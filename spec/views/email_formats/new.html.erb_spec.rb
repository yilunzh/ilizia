require 'rails_helper'

RSpec.describe "email_formats/new", type: :view do
  before(:each) do
    assign(:email_format, EmailFormat.new(
      :domain_id => "",
      :format => "",
      :valid => "",
      :status => "",
      :score => 1
    ))
  end

  it "renders new email_format form" do
    render

    assert_select "form[action=?][method=?]", email_formats_path, "post" do

      assert_select "input[name=?]", "email_format[domain_id]"

      assert_select "input[name=?]", "email_format[format]"

      assert_select "input[name=?]", "email_format[valid]"

      assert_select "input[name=?]", "email_format[status]"

      assert_select "input[name=?]", "email_format[score]"
    end
  end
end
