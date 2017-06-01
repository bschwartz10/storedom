require 'rails_helper'

RSpec.describe "Item Api" do
  it "returns a list of items" do
    Item.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
      )
    Item.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      image_url: "http://robohash.org/2.png?set=set2&bgset=bg1&size=200x200"
      )
    Item.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      image_url: "http://robohash.org/3.png?set=set2&bgset=bg1&size=200x200"
      )

      get '/api/v1/items'

      expect(response).to be_success
  end
end
