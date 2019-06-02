class Achievement < ApplicationRecord
    belongs_to :user
    belongs_to :achievement_type
end
