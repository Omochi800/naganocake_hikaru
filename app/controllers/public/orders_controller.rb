class Public::OrdersController < ApplicationController

def new
  @order = Order.new(order_params)
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
  @orders = Orders.all
end

def show
  @order = Order.find(params[:id])
end

def complete
end

def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
end


private
def order_params
  params.require(:order).permit(:payment_method,:postal_code,:address,:name)
end
end


