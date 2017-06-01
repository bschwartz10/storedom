class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
  end

  def update
    render json: Item.find(params[:id]).update(item_params)
  end

  def destroy
    render json: Item.find(params[:id]).delete
  end
  
  private

    def item_params
      params.permit(:name, :description, :image_url)
    end
end
