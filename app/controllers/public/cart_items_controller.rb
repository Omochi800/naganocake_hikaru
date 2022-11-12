class Public::CartItemsController < ApplicationController

    def index
       @cart_items = CartItem.all
    end

    def create
       @cart_item = CartItem.new(cart_item_params)
       @cart_item.save
        redirect_to public_cart_items_path

    end

    def destroy
        @cart_item = Item.find(params[:id])
        @cart_item.destroy
        redirect_to public_cart_items_path
    end

    def destroy_all
       @item.current_customer.items.destroy_all
       redirect_to public_cart_items_path
    end



    private

    def cart_item_params
        params.require(:cart_item).permit(:amount,:item_id)
    end
    def item_params
        params.require(:item).permit(:name,:introduction,:price,:image)
    end

end
