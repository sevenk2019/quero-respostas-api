class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.integer :tag_id
      t.string :body
      t.string :title
      t.integer :likes_count
      t.integer :dislikes_count

      t.timestamps
    end
  end
end
