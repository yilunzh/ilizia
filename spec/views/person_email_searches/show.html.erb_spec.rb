require 'rails_helper'

RSpec.describe "person_email_searches/show", type: :view do
  before(:each) do
    @person_email_search = assign(:person_email_search, PersonEmailSearch.create!(
      :first_name => "",
      :last_name => "",
      :domain_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
