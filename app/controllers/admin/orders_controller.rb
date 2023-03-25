class Admin::OrdersController < ApplicationController

    #管理者トップページ(注文履歴一覧)
    def index
    @orders = Order.all.page(params[:page]).per(10)
    end

    #注文詳細画面(ステータス編集を兼ねる)
    def show
    @orders = Order.find(params[:id])
    end
    
    #注文ステータスの更新
    def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
    end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  
end