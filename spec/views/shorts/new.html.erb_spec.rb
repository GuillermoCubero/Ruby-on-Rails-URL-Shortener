require 'rails_helper'

RSpec.describe "shorts/new", type: :view do
  before(:each) do
    assign(:short, Short.new(
      :user_url => "MyString"
    ))
  end

  it "renders new short form" do
    render

    assert_select "form[action=?][method=?]", shorts_path, "post" do

      assert_select "input#short_user_url[name=?]", "short[user_url]"
    end
  end
end
