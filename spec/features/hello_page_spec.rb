require "rails_helper"

RSpec.feature "RSpec Test", :type => :feature do
  scenario "Visit the Hello Page" do
    visit "/greetings/hello"
    expect(page).to have_text("Hello, World!")
  end
end
