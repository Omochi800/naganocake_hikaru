class RemoveNameFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :name, :string
  end
end
