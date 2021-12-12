class Inventory < ApplicationRecord
  belongs_to :user

  has_many :tickets
end
