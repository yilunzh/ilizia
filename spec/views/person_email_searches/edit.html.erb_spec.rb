require 'rails_helper'

RSpec.describe "person_email_searches/edit", type: :view do
  before(:each) do
    @person_email_search = assign(:person_email_search, PersonEmailSearch.create!(
      :first_name => "",
      :last_name => "",
      :domain_id => 1
    ))
  end

  it "renders the edit person_email_search form" do
    render

    assert_select "form[action=?][method=?]", person_email_search_path(@person_email_search), "post" do

      assert_select "input[name=?]", "person_email_search[first_name]"

      assert_select "input[name=?]", "person_email_search[last_name]"

      assert_select "input[name=?]", "person_email_search[domain_id]"
    end
  end
end
