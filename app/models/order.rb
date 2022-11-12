class Order < ApplicationRecord
  enum payment_methods:{credit_card:0,transfar:1}
  belongs_to:customers
  has_many:order_details,dependent: :destroy
end
