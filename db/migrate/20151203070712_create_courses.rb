class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :instructor
      t.integer :year
      t.integer :term
      t.integer :quantity
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
