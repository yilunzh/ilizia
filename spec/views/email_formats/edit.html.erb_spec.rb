require 'rails_helper'

RSpec.describe "email_formats/edit", type: :view do
  before(:each) do
    @email_format = assign(:email_format, EmailFormat.create!(
      :domain_id => "",
      :format => "",
      :valid => "",
      :status => "",
      :score => 1
    ))
  end

  it "renders the edit email_format form" do
    render

    assert_select "form[action=?][method=?]", email_format_path(@email_format), "post" do

      assert_select "input[name=?]", "email_format[domain_id]"

      assert_select "input[name=?]", "email_format[format]"

      assert_select "input[name=?]", "email_format[valid]"

      assert_select "input[name=?]", "email_format[status]"

      assert_select "input[name=?]", "email_format[score]"
    end
  end
end
