require 'rails_helper'

RSpec.describe "person_searches/edit", type: :view do
  before(:each) do
    @person_search = assign(:person_search, PersonSearch.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :domain_url => "MyString"
    ))
  end

  it "renders the edit person_search form" do
    render

    assert_select "form[action=?][method=?]", person_search_path(@person_search), "post" do

      assert_select "input[name=?]", "person_search[first_name]"

      assert_select "input[name=?]", "person_search[last_name]"

      assert_select "input[name=?]", "person_search[domain_url]"
    end
  end
end
