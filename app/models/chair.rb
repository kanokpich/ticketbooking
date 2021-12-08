class Chair < ApplicationRecord
  belongs_to :theater
  has_many :tickets
end
