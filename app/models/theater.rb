class Theater < ApplicationRecord
    has_many :timetables
    has_many :chairs
end