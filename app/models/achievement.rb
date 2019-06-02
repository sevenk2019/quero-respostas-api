class Achievement < ApplicationRecord
    belongs_to :user
    has_one :achievement_type
end
