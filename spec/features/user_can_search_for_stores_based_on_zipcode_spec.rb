require 'rails_helper'

RSpec.feature "user visits root path and types in zipcode" do
  scenario "redirected to stores index page and is shown the 10 closet stores"do
    VCR.use_cassette("bb_search_index_page") do
      visit '/'
      fill_in :search, with: "80202"
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("Stores within 25 miles of 80202")
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_content("Name: BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("Name: BEST BUY - SOUTHGLENN")
      expect(page).to have_content("City: DENVER")
      expect(page).to have_content("City: CENTENNIAL")
      expect(page).to have_content("Distance: 3.45 Miles")
      expect(page).to have_content("Distance: 11.02 Miles")
      expect(page).to have_content("Phone: 303-270-9189")
      expect(page).to have_content("Phone: 303-797-3246")
      expect(page).to have_content("StoreType: Mobile SAS")
      expect(page).to have_content("StoreType: Big Box")
    end
  end
end
