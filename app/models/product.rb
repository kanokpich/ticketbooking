class Product < ApplicationRecord
  belongs_to :beverage
  belongs_to :inventory
end
