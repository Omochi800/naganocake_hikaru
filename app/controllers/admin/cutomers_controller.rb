class Admin::CutomersController < ApplicationController

  def index
    @customrs = Customers.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
