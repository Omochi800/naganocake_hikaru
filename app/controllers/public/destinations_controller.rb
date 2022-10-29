class Public::DestinationsController < ApplicationController

  def index
    @destination = Destination.new
    @destinations = Destination.all
  end

  def create
    @destination = Destinatione.new(destination_params)
  if @destination.save
    redirect_to destination_path
  else
    @destinations = Destination.all
    render :index
  end

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
    @destination.destroy
    redirect_to destination_path
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name,:postal_code,:address)
  end

end
