class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre_new = Genre.new
  end

  def create
    genre_new = Genre.new(genre_params)
    if genre_new.save
      redirect_to admins_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update
    redirect_to adimins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
