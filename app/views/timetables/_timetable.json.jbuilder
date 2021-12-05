json.extract! timetable, :id, :time_start, :time_stop, :movie_id, :theater_id, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
