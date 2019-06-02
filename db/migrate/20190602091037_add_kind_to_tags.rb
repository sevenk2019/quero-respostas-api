class AddKindToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :kind, :string
  end
end
