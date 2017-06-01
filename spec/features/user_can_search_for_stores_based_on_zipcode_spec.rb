require 'rails_helper'

RSpec.feature "user visits root path and types in zipcode" do
  scenario "redirected to stores index page and is shown the 10 closet stores"do

    visit '/'
    fill_in :search, with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Stores within 25 miles of 80202")
    expect(page).to have_content("Stores within 25 miles of 80202")
  end
end
