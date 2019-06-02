class Achievement < ApplicationRecord
    belongs_to :user
    belongs_to :achievement_type

    def self.create_by_name(name, user: user)
        Achievement.create(
            user: user,
            unlocked: true,
            achievement_type: AchievementType.find_by(name: name)
        )
    end
end
