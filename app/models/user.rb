class User < ApplicationRecord
    has_and_belongs_to_many :tags
    has_and_belongs_to_many :courses
    has_many :achievements

    has_many :questions
    has_many :answers

    def likes
        questions.count + answers.count
    end
end
