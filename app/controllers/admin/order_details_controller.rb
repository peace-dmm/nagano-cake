class Admin::OrderDetailsController < ApplicationController
    
    #製作ステータスの更新
    def update
    order_details = OrderDetails.find(params[:id])
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.making_status == "in_production"
      @order_details.each do |order_detail|
      if order_detail.making_status != "production_complete"
      is_updated = false
      end
      end
      @order.update(status: 3) if is_updated
    end
    redirect_to admin_order_path(order)
    end
end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end