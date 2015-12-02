class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :year
      t.integer :term
      t.string :instructor
      t.integer :quantity
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
