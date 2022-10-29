class Public::CartItemsController < ApplicationController

    def index
       @items = Item.all
    end

    def create
       @cart_item = Item.find_by(:name)

    if  @cart_item.amount += params[:amount].to_i
        @cartitem.save
        redirect_to cart_items_path
    else
       @cart_item.save
       render :index
    end
    end


    def destroy
       @item.current_customer.items.destroy_all
       redirect_to cart_items_path
    end



    private

    def cart_item_params
        params.require(:cart_item).permit(:item_id,:amount)
    end
end
