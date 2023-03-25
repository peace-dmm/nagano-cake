class Item < ApplicationRecord
  has_one_attached :item_image
  
  has_many :cart_item
  has_many :order_detail
  has_many :order, through: :order_details
  belongs_to :genre#, optional: true#実装されたら外す

  validates :amount, presence: true
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :item_image, presence: true

  def with_tax_price
    (price * 1.1).floor
  end
end
