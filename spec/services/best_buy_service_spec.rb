require 'rails_helper'

RSpec.describe "find best buy stores by zipcode" do
  it "returns 10 bestbuy stores" do
    VCR.use_cassette("best_buy_find_buy_zip_code") do
      zipcode = "80202"
      stores = BestBuyService.find_by_zip_code(zipcode)

      store1 = stores.first

      expect(stores.count).to eq(10)
      expect(stores).to be_an(Array)
      expect(store1).to be_a(Hash)
      expect(store1).to have_key(:longName)
      expect(store1).to have_key(:city)
      expect(store1).to have_key(:distance)
      expect(store1).to have_key(:phone)
      expect(store1).to have_key(:storeType)
    end
  end
end
