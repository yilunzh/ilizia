require 'rails_helper'

RSpec.describe "person_searches/show", type: :view do
  before(:each) do
    @person_search = assign(:person_search, PersonSearch.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :domain_url => "Domain Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Domain Url/)
  end
end
