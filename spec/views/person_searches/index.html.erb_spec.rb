require 'rails_helper'

RSpec.describe "person_searches/index", type: :view do
  before(:each) do
    assign(:person_searches, [
      PersonSearch.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :domain_url => "Domain Url"
      ),
      PersonSearch.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :domain_url => "Domain Url"
      )
    ])
  end

  it "renders a list of person_searches" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Domain Url".to_s, :count => 2
  end
end
