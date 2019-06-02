class AddLikes < SeedMigration::Migration
  def up
    Question.all.each do |q|
      q.likes_count = [10, 20, 30, 33, 55, 65, 548, 11].sample
      q.dislikes_count = [10, 20, 30, 33, 55, 65, 548, 11].sample
      q.save
    end

    Answer.all.each do |a|
      a.likes_count = [10, 20, 30, 33, 55, 65, 548, 11].sample
      a.dislikes_count = [10, 20, 30, 33, 55, 65, 548, 11].sample
      a.save
    end
  end

  def down
    Question.all.each do |q|
      q.likes_count = nil
      q.dislikes_count = nil
      q.save
    end

    Answer.all.each do |a|
      a.likes_count = nil
      a.dislikes_count = nil
      a.save
    end
  end
end
