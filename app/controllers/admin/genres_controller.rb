class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
  if @genre.save
    redirect_to admin_genres_path
  else
    @genres = Genre.all
    render :index
  end

  end

  def edit
  end

  def update
      @genre = Genre.find(params[:id])
  if  @genre.update
    redirect_to admin_genres_path
  else
    render :edit
  end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def set_genre
    @genre = genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end


end
