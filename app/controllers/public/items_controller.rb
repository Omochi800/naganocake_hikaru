class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.where(is_active: true)
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:image)
  end


end
