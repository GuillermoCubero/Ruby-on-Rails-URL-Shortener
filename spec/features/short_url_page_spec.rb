require "rails_helper"

RSpec.feature "RSpec Test", :type => :feature do
  scenario "Visit the Short Url Page and short an URL" do
    visit "/greetings/short"  #en esta línea sobra el /greetings ??
    expect(page).to have_text("Acortador de URL")
    click_button "Acortar"
    expect(page).to have_text("Tu URL acortada")
  end
end
