class Public::OrdersController < ApplicationController

def new
  @order = Order.new

end

def create
  cart_items = current_customer.cart_items.all
  @order = current_customer.orders.new(order_params)
if@order.save!
  cart_items.each do |cart|
    order_item = OrderItem.new
    order_item.item_id = cart.item_id
    order_item.order_id = @order.id
    order_item.order_amount = cart.amount
    order_item.save
end
  redirect_to '/public/orders/:order_id/complete'
  @cart_items.destroy_all
else
    @order = Order.new(order_params)
    render :complete
end
end

def index
  @orders = Order.all
end

def show
  @order =current_customer.order_id
end

def complete
end

def confirm
    @cart_items = CartItem.all
    @order = Order.new
if params[:order][:select_address] == "0"
   @order.postal_code = current_customer.postal_code
   @order.address = current_customer.address
   @order.name = current_customer.first_name + current_customer.last_name
elsif params[:order][:select_address] == "1"
    @destination = Destination.find(params[:order][:address_id])
    @order.postal_code = @destination.postal_code
    @order.address = @destination.address
    @order.name = @destination.name
elsif params[:order][:select_address] == "2"
    @order = Order.new(order_params)

end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sub_total }
    @postage = 800
    @sum = 0
end

private
def order_params
  params.require(:order).permit(:payment_method,:postal_code,:address,:name)
end
def destination_params
  params.require(:destination).permit(:address_id,:select_address)
end
end

