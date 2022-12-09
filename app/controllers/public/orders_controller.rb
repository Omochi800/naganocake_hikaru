class Public::OrdersController < ApplicationController
before_action :authenticate_customer!
def new
  @order = Order.new

end

def create
  @order = current_customer.orders.new(order_params)
  @order.customer_id = current_customer.id
if@order.save
  @cart_items = current_customer.cart_items
  @cart_items.each do |cart|
    order_detail = OrderDetail.new(order_id: @order.id)
    order_detail.item_id = cart.item_id
    order_detail.order_id = @order.id
    order_detail.amount = cart.amount
    order_detail.price = cart.item.price
    order_detail.save

end
  @cart_items.destroy_all
  redirect_to public_orders_complete_path

else
    render :new
end
end

def index
  @orders = current_customer.orders.page(params[:page])
end

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details.all
  @sum = 0

end

def complete
end

def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
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
    @order.postage = 800
    @sum = 0
end

private
def order_params
  params.require(:order).permit(:payment_method,:postal_code,:address,:name,:billing_amount,:postage,:payment_method,:order_status)
end
def destination_params
  params.require(:destination).permit(:address_id,:select_address)
end
end

