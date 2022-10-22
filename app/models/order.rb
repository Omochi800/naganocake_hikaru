class Order < ApplicationRecord
  enum payment_methods:{credit_card:0,transfar:1}
  belongs_to:customer
  has_many:order_details,dependent: :destroy
end
