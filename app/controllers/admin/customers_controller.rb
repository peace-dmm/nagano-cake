class Admin::CustomersController < ApplicationController

 def index
 @customer=Admin.all
 end

 def show
 @customer=Admin.all

 end

 def edit
 # @customer=Customer.find(params[:id])
 end

end
private

def customer_params
params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
end