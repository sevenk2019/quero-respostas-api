class User < ApplicationRecord
    has_and_belongs_to_many :tags
    has_and_belongs_to_many :courses
    has_many :achievements

    def authenticate

    end
end
