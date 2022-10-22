class Item < ApplicationRecord
  has_one_attached :image
  validates :is_active,inclusion:{in:[true,false]}
  has_many:order_details,dependent: :destroy
  has_many:cart_items,dependent: :destroy
  belongs_to:genre
end
