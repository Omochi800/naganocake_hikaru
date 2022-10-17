class Order < ApplicationRecord
  enum payment_methods:{credit_card:0,transfar:1}
end
