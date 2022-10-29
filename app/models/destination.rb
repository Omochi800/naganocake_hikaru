class Destination < ApplicationRecord
  belongs_to:customer

  def destination_display
    "〒" + postal_code + '' + address + '' + name
  end
end
