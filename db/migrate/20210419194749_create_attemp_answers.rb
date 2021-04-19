class CreateAttempAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :attemp_answers do |t|
      t.references :attemp, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
