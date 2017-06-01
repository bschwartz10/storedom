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
      items = JSON.parse(response.body)
      expect(items.count).to eq(3)
  end

  it "show page returns one item" do
    id = Item.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
          ).id

    get "/api/v1/items/#{id}"

    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end

  it "can create an item" do
    item_params = {
                    name: "Brett",
                    description: Faker::Lorem.paragraph,
                    image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
                  }

    post '/api/v1/items', item_params
    item = Item.last
    expect(response).to be_success
    expect(item.name).to eq("Brett")
  end
  it "can update an item" do
    item = Item.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
          )
    item_params = {name: "Brett"}
    previous_name = item.name

    put "/api/v1/items/#{item.id}", item_params

    expect(response).to be_success
    expect(Item.last.name).to_not eq(previous_name)
    expect(Item.last.name).to eq("Brett")
  end

  it "can delete an item" do
    item = Item.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
          )

      expect(Item.count).to eq(1)
      delete "/api/v1/items/#{item.id}"

      expect(response).to be_success
      expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
