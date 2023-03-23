class Customer::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Items.limit(4).order("created_at DESC")
  end

  def about
  end
end
