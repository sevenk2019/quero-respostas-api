class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.boolean :unlocked, default: false
      t.references :achievement_type, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
