class Customer::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.order('id DESC').limit(4)
  end

  def about
    @genre = Genre.find(params[:id])
  end
end
