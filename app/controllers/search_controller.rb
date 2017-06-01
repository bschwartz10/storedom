class SearchController < ApplicationController

  def index
    @zipcode = params[:search]
    @stores = BestBuyStore.find_by_zip_code(@zipcode)
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType,&pageSize=10&apiKey=7a3heu7emrjz6qbsugmepbv6")
    # @raw_stores = JSON.parse(response.body, :symbolize_names => true)
    # @stores = JSON.parse(response.body, :symbolize_names => true)[:stores]
  end

end
