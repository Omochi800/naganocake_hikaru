class Public::DestinationsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @destination = Destination.new
    @destinations = Destination.page(params[:page])
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.customer_id = current_customer.id
    @destination.save
    redirect_to public_destinations_path
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
     @destination = Destination.find(params[:id])
  if  @destination.update
    redirect_to destinations_path
  else
    render :edit
  end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to public_destinations_pathd
  end

  private

  def destination_params
    params.require(:destination).permit(:name,:postal_code,:address)
  end

  def set_destination
    @destination = Destination.find(params[:id])
  end



end
