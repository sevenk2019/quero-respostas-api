class RemoveTagIdFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :tag_id, :integer
  end
end
