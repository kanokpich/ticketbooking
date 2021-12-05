class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :type
      t.datetime :date_in
      t.datetime :date_out
      t.integer :duration

      t.timestamps
    end
  end
end
