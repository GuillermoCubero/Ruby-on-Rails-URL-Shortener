require 'rails_helper'

RSpec.describe "shorts/new", type: :view do
  before(:each) do
    assign(:short, Short.new(
      :url => "http://myurl.com"
    ))
  end

  it "renders new short form" do
    render

    assert_select "form[action=?][method=?]", shorts_path, "post" do

      assert_select "input#short_url[name=?]", "short[url]"
    end
  end
end
