class Customer::CartItemController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0){|sum, item| sum + item.subtotal}#ｶｰﾄに入っているID分繰り返し処理　#subtotal(税込価格＋個数)
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.item_id = params[:cart_item][:item_id]#ｶｰﾄIDとｱｲﾃﾑId配列として持たせる
    current_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #↓数量変更if
    if current_cart_item.present?#ｶｰﾄIDの存在を確認(あればtrue)
      current_cart_item.amount += params[:cart_item][:amount].to_i#数量
      current_cart_item.save
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])#数量変更したID取得
    cart_item.amount = params[:cart_item][:amount].to_i#数量更新
    cart_item.save

    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0){|sum, item| sum + item.subtotal}#リスト&価格更新
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0){|sum, item| sum + item.subtotal}#リスト&価格更新
  end

  def destroy_all
    current_customer.cart_items.destroy_all

    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0){|sum, items| sum + item.subtotal}#リスト&価格更新
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
