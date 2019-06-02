class AddDefaultToLikes < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :likes_count, :integer, default: 0
    change_column :answers, :dislikes_count, :integer, default: 0

    change_column :questions, :likes_count, :integer, default: 0
    change_column :questions, :dislikes_count, :integer, default: 0
  end
end
