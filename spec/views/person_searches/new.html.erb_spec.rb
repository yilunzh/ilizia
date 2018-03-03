require 'rails_helper'

RSpec.describe "person_searches/new", type: :view do
  before(:each) do
    assign(:person_search, PersonSearch.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :domain_url => "MyString"
    ))
  end

  it "renders new person_search form" do
    render

    assert_select "form[action=?][method=?]", person_searches_path, "post" do

      assert_select "input[name=?]", "person_search[first_name]"

      assert_select "input[name=?]", "person_search[last_name]"

      assert_select "input[name=?]", "person_search[domain_url]"
    end
  end
end
