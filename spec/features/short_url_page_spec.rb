require "rails_helper"

RSpec.feature "RSpec Test", :type => :feature do
  
  scenario "Visit the Short Url Page" do
    visit "/short"
    expect(page).to have_text("Acortador de URL")
    expect(page).to have_title("")#Titulo de la página? o con el have_text vale?
  end
  
  scenario "Short an invalid URL" do
    visit "/short"
    click_button "Acortar"
    expect(page).to have_content("Error: Introduzca una URL válida")
  end
  
  scenario "Short a valid URL" do
    visit "/short"
    fill_in "URL", with: "" ## una url válida. 
    click_button "Acortar"
    expect(page).to have_title("Tu URL acortada")
    expect(page).to have_text("Copiar al portapapeles")
  end
  
end
