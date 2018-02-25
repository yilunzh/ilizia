require 'rails_helper'

RSpec.describe "domain_email_formats/index", type: :view do
  before(:each) do
    assign(:domain_email_formats, [
      DomainEmailFormat.create!(
        :format => "",
        :confirmed => "",
        :status => "",
        :score => 2
      ),
      DomainEmailFormat.create!(
        :format => "",
        :confirmed => "",
        :status => "",
        :score => 2
      )
    ])
  end

  it "renders a list of domain_email_formats" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
