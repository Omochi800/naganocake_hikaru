class Item < ApplicationRecord
  has_one_attached :image
  validates :is_active,inclusion:{in:[true,false]}
  has_many:order_details,dependent: :destroy
  has_many:cart_items,dependent: :destroy
  belongs_to:genres,optional: true


  def with_tax_price
    (price * 1.1).floor
  end

  def get_image
  unless image.attached?
      file_path = Rails.root.join('app/assets/images/sweets_tarte_strawberry.png')
      image.attach(io: File.open(file_path), filename: 'sweets_tarte_strawberry.png', content_type: 'image/png')
  end
    image

  end
end
