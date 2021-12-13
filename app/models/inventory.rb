class Inventory < ApplicationRecord
  belongs_to :user

  has_many :tickets
  has_many :product

  def get_inventory_ticket
    return Ticket.where(:inventory_id => Inventory.where(id:id)).order("created_at DESC")
  end

  def get_ticket_price
    return Ticket.joins(:chair).where(:inventory_id => Inventory.where(id:id)).sum(:price)
  end

  def get_product_price
    return Product.joins(:beverage).where(:inventory_id => Inventory.where(id:id)).sum(:price)
  end

  def sum_price
    return get_ticket_price + get_product_price
  end

  def get_inventory_product
    return Product.where(:inventory_id => Inventory.where(id:id)).order("created_at DESC")
  end
end
