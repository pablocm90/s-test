class CreateAttemps < ActiveRecord::Migration[6.1]
  def change
    create_table :attemps do |t|
      t.float :score, null: false, default: 0
      t.integer :correct_answers, null: false, default: 0
      t.integer :wrong_answers, null: false, default: 0
      t.integer :total_answers, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
