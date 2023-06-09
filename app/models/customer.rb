class Customer < ApplicationRecord
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#リレーション
  has_many :orders
  has_many :delivery_addresses
  has_many :cart_items

#注文時自分の住所入力用
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + last_name + ' ' + first_name
  end

end
