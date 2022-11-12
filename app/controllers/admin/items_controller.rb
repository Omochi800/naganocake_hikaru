class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  if@item.update(item_params)
    redirect_to admin_items_path(@item)
  else
    render :edit
  end
  end


  private

  def item_params
    params.require(:item).permit(:name,:image,:introduction,:price,:is_active,:genre_id)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end


end
