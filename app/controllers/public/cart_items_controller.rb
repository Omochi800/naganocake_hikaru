class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!
    def index
       @cart_items = current_customer.cart_items
       @sum = 0
       @order = Order.new
    end

    def create
       @cart_item = CartItem.new(cart_item_params)
       @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
       cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.amount += params[:cart_item][:amount].to_i
       cart_item.save
       redirect_to public_cart_items_path

    elsif @cart_item.save
        redirect_to public_cart_items_path
    end
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to public_cart_items_path
    end

    def destroy_all
       current_customer.cart_items.destroy_all
       redirect_to public_cart_items_path
    end

    def  update
        @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
        redirect_to public_cart_items_path
    end
    end



    private

    def cart_item_params
        params.require(:cart_item).permit(:amount,:item_id)
    end
    def item_params
        params.require(:item).permit(:name,:introduction,:price,:image)
    end

end
