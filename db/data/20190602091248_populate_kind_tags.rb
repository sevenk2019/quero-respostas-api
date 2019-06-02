class PopulateKindTags < SeedMigration::Migration
  def up
    Tag.all.update_all(kind: "subject")
  end

  def down
    Tag.all.update_all(kind: nil)
  end
end
  