require 'rails_helper'

RSpec.describe "shorts/index", type: :view do
  before(:each) do
    assign(:shorts, [
      Short.create!(
        :user_url => "User Url"
      ),
      Short.create!(
        :user_url => "User Url"
      )
    ])
  end

  it "renders a list of shorts" do
    render
    assert_select "tr>td", :text => "User Url".to_s, :count => 2
  end
end
