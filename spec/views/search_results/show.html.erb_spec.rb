require 'rails_helper'

RSpec.describe "search_results/show", type: :view do
  before(:each) do
    @search_result = assign(:search_result, SearchResult.create!(
      :email_format => "Email Format",
      :email => "Email",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email Format/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Status/)
  end
end
