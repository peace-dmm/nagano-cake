class ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = Item.where(genre_id:@genre.id).page(params[:page]).per(8)#.order(created_at: :desc)#登録順に上から表示
    else
      @items = Item.page(params[:page]).per(8)#.order(created_at: :desc)#登録順に上から表示
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
