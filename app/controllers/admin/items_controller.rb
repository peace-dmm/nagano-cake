class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  private
  def item_prams
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end
end