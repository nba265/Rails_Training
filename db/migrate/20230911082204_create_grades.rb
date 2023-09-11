class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :subject
      t.decimal :score
      t.integer :semester
      t.string :comments

      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
