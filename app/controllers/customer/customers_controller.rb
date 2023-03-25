class Customer::CustomersController < ApplicationController

 def top
 end

 def index
 end

 def edit
 @customer=current_customer
 end

 def show
 @customer = current_customer
 end

 def update
 customer = current_customer
 customer.update(customer_params)
 redirect_to customers_my_page_path
 end

 def quit
 end

 def out
 @customer = current_customer
 # is_deletedカラムをtrueに変更することにより削除フラグを立てる
 @customer.update(is_deleted: true)
 reset_session
 redirect_to root_path
 end

private

def customer_params
params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
end
end
