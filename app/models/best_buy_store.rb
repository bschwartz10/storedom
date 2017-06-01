class BestBuyStore
  attr_reader :name, :city, :distance, :phone, :store_type

  def initialize(attrs = {})
    require "pry"; binding.pry
    @name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @store_type = attrs[:storeType]
  end

  def self.find_by_zip_code(zipcode)
    BestBuyService.zip_code_by(zipcode).map do |store|
      new(store)
    end
  end


end
