require 'rails_helper'

RSpec.describe "shorts/index", type: :view do
  before(:each) do
    allow(view).to receive(:will_paginate)
    assign(:shorts, [
      Short.create!(
        :url => "http://userurl.com"
      ),
      Short.create!(
        :url => "http://userurl.com"
      )
    ])
  end

  it "renders a list of shorts" do
    render
    assert_select "tr>td", :text => "http://userurl.com".to_s, :count => 2
  end
end
