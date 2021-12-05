class Ticket < ApplicationRecord
  belongs_to :timetable
  belongs_to :chair
end
