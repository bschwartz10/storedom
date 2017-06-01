class BestBuyService

  def self.find_by_zip_code(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType,&pageSize=10&apiKey=#{ENV['api_key']}")
    JSON.parse(response.body, :symbolize_names => true)[:stores]
  end


end
