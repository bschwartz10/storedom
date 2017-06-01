require 'rails_helper'

describe BestBuyStore do
  scenario "it should return a stores info" do
    raw_store = {
      longName: "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
      city: "DENVER",
      distance: 3.45,
      phone: "303-270-9189",
      storeType: "Mobile SAS"
    }

    store = BestBuyStore.new(raw_store)

    expect(store.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(store.city).to eq("DENVER")
    expect(store.distance).to eq(3.45)
    expect(store.phone).to eq("303-270-9189")
    expect(store.store_type).to eq("Mobile SAS")
  end
end
