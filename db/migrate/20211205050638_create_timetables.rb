class CreateTimetables < ActiveRecord::Migration[6.1]
  def change
    create_table :timetables do |t|
      t.datetime :time_start
      t.datetime :time_stop
      t.references :movie, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
