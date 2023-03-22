class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def subtotal#税込合計 × 個数
    item.with_tax_price * amount#個数
  end
end
