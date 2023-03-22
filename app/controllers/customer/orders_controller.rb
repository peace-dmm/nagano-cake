class Customer::OrdersController < ApplicationController

    #注文情報入力画面(支払方法・配送先の選択)
    def new
    @order = Order.new
    @addresses = DeliveryAddress.all
    #@addresses = current_customer.DeliveryAddress.all
    end

    #注文情報確認画面
    def confirm
    @order = Order.new
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      #@cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
    end

    #注文完了画面
    def complete
    end

    #注文確定処理
    def create
    order = Order.new
    order.save
    #@cart_items = current_customer.cart_items.all
    #@cart_items.each do |cart_item|
      #@order_details = OrderDetail.new
      #@order_details.order_id = order.id
      #@order_details.item_id = cart_item.item.id
      #@order_details.price = cart_item.item.price_excluding_tax
      #@order_details.number = cart_item.amount
      #@order_details.manufacture_status = 0
      #@order_details.save!
    #end
    #CartItem.destroy_all
    redirect_to orders_complete_path
    end

    #注文履歴画面
    def index
    @orders = Order.all
    #@orders = current_customer.Order.all
    end

    #注文履歴詳細画面
    def show
    @order = Order.find(params[:id])
    end

end
