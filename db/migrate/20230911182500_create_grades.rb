class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :subject
      t.float :score
      t.string :semester
      t.text :comments
      t.belongs_to :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
