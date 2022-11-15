class Public::OrdersController < ApplicationController

def new
  @order = Order.new
  @destination.customer_id = current_customer.id
end

def create
  @order = Order.new(order_params)
if@order.save
  redirect_to public_orders_path
else
  @orders = Orders.all
  render :index
end
end

def index
  @orders = Order.all
end

def show
  @order = Order.find(params[:id])
end

def complete
end

def confirm
    @order = Order.new(order_params)
    @destination = Destination.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.destination = @destination.destination
    @order.name = @destination.name
end


private
def order_params
  params.require(:order).permit(:payment_method,:delivery_postal_code,:delivery_address,:delivery_name)
end
end


