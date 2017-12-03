class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    # for each item in cart
    Cart.all.each do |cart|
      sum = cart.lineitems.group(:product_id).sum(:quantity)

      sum.each do |product_id, quantity|
        if quantity > 1
          cart.lineitems.where(product_id: product_id).delete_all
          # replace with single item
          item = cart.lineitems.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
