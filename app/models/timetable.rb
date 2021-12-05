class Timetable < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :movies
  has_many :theaters
end
