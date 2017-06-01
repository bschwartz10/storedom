class SearchController < ApplicationController

  def index
    @zipcode = params[:search]
    @stores = BestBuyStore.find_by_zip_code(@zipcode)
    @total = BestBuyService.zip_code_by(@zipcode)[:total]
  end

end
