class CreateAttemps < ActiveRecord::Migration[6.1]
  def change
    create_table :attemps do |t|
      t.float :sucess_rate
      t.integer :answered_questions
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
