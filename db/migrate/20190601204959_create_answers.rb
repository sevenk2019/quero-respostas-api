class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.string :body
      t.integer :likes_count
      t.integer :dislikes_count

      t.timestamps
    end
  end
end
