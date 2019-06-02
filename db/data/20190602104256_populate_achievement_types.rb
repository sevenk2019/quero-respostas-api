class PopulateAchievementTypes < SeedMigration::Migration
  @types = [
    "100 likes",
    "200 likes",
    "500 likes",
    "1000 likes",
    "100 questions",
    "200 questions",
    "500 questions",
    "1000 questions",
    "100 answers",
    "200 answers",
    "500 answers",
    "1000 answers"
  ]
  def up
    types.each do |type|
      AchievementType.create(name: type)
    end
  end

  def down
    AchievementType.where(name: @types).destroy!
  end
end
