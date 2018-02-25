require 'rails_helper'

RSpec.describe "person_email_searches/index", type: :view do
  before(:each) do
    assign(:person_email_searches, [
      PersonEmailSearch.create!(
        :first_name => "",
        :last_name => "",
        :domain_id => 2
      ),
      PersonEmailSearch.create!(
        :first_name => "",
        :last_name => "",
        :domain_id => 2
      )
    ])
  end

  it "renders a list of person_email_searches" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
