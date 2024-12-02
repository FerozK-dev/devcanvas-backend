class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :school, null: false
      t.string :degree
      t.string :field
      t.integer :start_year
      t.integer :end_year
      t.string :grade
      t.text :activities
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
