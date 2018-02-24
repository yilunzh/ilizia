require 'rails_helper'

RSpec.describe "email_formats/index", type: :view do
  before(:each) do
    assign(:email_formats, [
      EmailFormat.create!(
        :domain_id => "",
        :format => "",
        :valid => "",
        :status => "",
        :score => 2
      ),
      EmailFormat.create!(
        :domain_id => "",
        :format => "",
        :valid => "",
        :status => "",
        :score => 2
      )
    ])
  end

  it "renders a list of email_formats" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
