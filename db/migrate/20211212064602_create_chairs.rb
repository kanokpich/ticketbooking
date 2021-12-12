class CreateChairs < ActiveRecord::Migration[6.1]
  def change
    create_table :chairs do |t|
      t.string :name
      t.integer :price
      t.string :chairtype
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
