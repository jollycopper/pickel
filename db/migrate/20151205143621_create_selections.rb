class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps null: false
    end
    add_index :selections, :user_id
    add_index :selections, :course_id
    add_index :selections, [:user_id, :course_id], unique: true
  end
end
