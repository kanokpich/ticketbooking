class Inventory < ApplicationRecord
  belongs_to :user

  has_many :tickets

  def get_inventory_item
    return Ticket.where(:inventory_id => Inventory.where(id:id)).order("created_at DESC")
  end
end
