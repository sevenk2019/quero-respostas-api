class Tag < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :courses
    has_and_belongs_to_many :questions
end
