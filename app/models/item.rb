class Item < ApplicationRecord
  has_one_attached :image
  validates :is_active,inclusion:{in:[true,false]}
  has_many:order_details,dependent: :destroy
  has_many:cart_items,dependent: :destroy
  belongs_to:genre

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end
end
