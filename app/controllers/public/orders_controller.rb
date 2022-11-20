class Public::OrdersController < ApplicationController

def new
  @order = Order.new

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
end

private
def order_params
  params.require(:order).permit(:payment_method,:postal_code,:address,:name)
end
def destination_params
  params.require(:destination).permit(:address_id,:select_address)
end
end

