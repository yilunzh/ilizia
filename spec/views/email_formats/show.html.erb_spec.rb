require 'rails_helper'

RSpec.describe "email_formats/show", type: :view do
  before(:each) do
    @email_format = assign(:email_format, EmailFormat.create!(
      :domain_id => "",
      :format => "",
      :valid => "",
      :status => "",
      :score => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
