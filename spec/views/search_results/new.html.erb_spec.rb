require 'rails_helper'

RSpec.describe "search_results/new", type: :view do
  before(:each) do
    assign(:search_result, SearchResult.new(
      :email_format => "MyString",
      :email => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new search_result form" do
    render

    assert_select "form[action=?][method=?]", search_results_path, "post" do

      assert_select "input[name=?]", "search_result[email_format]"

      assert_select "input[name=?]", "search_result[email]"

      assert_select "input[name=?]", "search_result[status]"
    end
  end
end
