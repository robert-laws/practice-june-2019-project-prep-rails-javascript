class CreateBookSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :book_subjects do |t|
      t.references :book, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
