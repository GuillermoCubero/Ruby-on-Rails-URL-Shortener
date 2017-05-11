require 'rails_helper'

RSpec.describe "shorts/edit", type: :view do
  before(:each) do
    @short = assign(:short, Short.create!(
      :user_url => "http://myurl.com"
    ))
  end

  it "renders the edit short form" do
    render

    assert_select "form[action=?][method=?]", short_path(@short), "post" do

      assert_select "input#short_user_url[name=?]", "short[user_url]"
    end
  end
end
