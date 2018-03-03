require 'rails_helper'

RSpec.describe "domain_formats/show", type: :view do
  before(:each) do
    @domain_format = assign(:domain_format, DomainFormat.create!(
      :domain_url => "",
      :format => "",
      :status => "",
      :score => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
