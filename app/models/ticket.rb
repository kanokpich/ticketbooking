class Ticket < ApplicationRecord
  belongs_to :timetable
  belongs_to :chair
  belongs_to :inventory
end
