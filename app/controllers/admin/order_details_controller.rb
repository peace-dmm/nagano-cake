class Admin::OrderDetailsController < ApplicationController
    
    #製作ステータスの更新
    def update
    order_details = OrderDetails.find(params[:id])
    order_details.update(status: order_detail.making_status)
    redirect_to admin_order_path(order)
    end
end
