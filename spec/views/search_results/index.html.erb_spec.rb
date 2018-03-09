require 'rails_helper'

RSpec.describe "search_results/index", type: :view do
  before(:each) do
    assign(:search_results, [
      SearchResult.create!(
        :email_format => "Email Format",
        :email => "Email",
        :status => "Status"
      ),
      SearchResult.create!(
        :email_format => "Email Format",
        :email => "Email",
        :status => "Status"
      )
    ])
  end

  it "renders a list of search_results" do
    render
    assert_select "tr>td", :text => "Email Format".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
