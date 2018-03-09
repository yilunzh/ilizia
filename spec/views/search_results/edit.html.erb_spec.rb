require 'rails_helper'

RSpec.describe "search_results/edit", type: :view do
  before(:each) do
    @search_result = assign(:search_result, SearchResult.create!(
      :email_format => "MyString",
      :email => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit search_result form" do
    render

    assert_select "form[action=?][method=?]", search_result_path(@search_result), "post" do

      assert_select "input[name=?]", "search_result[email_format]"

      assert_select "input[name=?]", "search_result[email]"

      assert_select "input[name=?]", "search_result[status]"
    end
  end
end
