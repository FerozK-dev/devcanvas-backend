class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title, null: false
      t.string :employment_type
      t.string :company, null: false
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :industry
      t.string :headline
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
