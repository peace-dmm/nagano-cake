class AddCustomerIdToDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :delivery_addresses, :customer_id, :integer
  end
end
