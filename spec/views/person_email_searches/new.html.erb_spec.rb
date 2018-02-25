require 'rails_helper'

RSpec.describe "person_email_searches/new", type: :view do
  before(:each) do
    assign(:person_email_search, PersonEmailSearch.new(
      :first_name => "",
      :last_name => "",
      :domain_id => 1
    ))
  end

  it "renders new person_email_search form" do
    render

    assert_select "form[action=?][method=?]", person_email_searches_path, "post" do

      assert_select "input[name=?]", "person_email_search[first_name]"

      assert_select "input[name=?]", "person_email_search[last_name]"

      assert_select "input[name=?]", "person_email_search[domain_id]"
    end
  end
end
