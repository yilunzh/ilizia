require 'rails_helper'

RSpec.describe "domain_formats/index", type: :view do
  before(:each) do
    assign(:domain_formats, [
      DomainFormat.create!(
        :domain_url => "",
        :format => "",
        :status => "",
        :score => 2
      ),
      DomainFormat.create!(
        :domain_url => "",
        :format => "",
        :status => "",
        :score => 2
      )
    ])
  end

  it "renders a list of domain_formats" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
