class AchievementsRegister
    def earn_likes(user, likes)
        user.achievements << Achievement
            .create_by_name("100 likes", user: user) if likes == 100
        user.achievements << Achievement
            .create_by_name("200 likes", user: user) if likes == 200
        user.achievements << Achievement
            .create_by_name("500 likes", user: user) if likes == 500
        user.achievements << Achievement
            .create_by_name("1000 likes", user: user) if likes == 1000
    end

    def make_questions(user, questions)
        user.achievements << Achievement
            .create_by_name("100 questions", user: user) if questions == 100
        user.achievements << Achievement
            .create_by_name("200 questions", user: user) if questions == 200
        user.achievements << Achievement
            .create_by_name("500 questions", user: user) if questions == 500
        user.achievements << Achievement
            .create_by_name("1000 questions", user: user) if questions == 1000
    end

    def answer_questions(user, answers)
        user.achievements << Achievement
            .create_by_name("100 answers", user: user) if questions == 100
        user.achievements << Achievement
            .create_by_name("200 answers", user: user) if questions == 200
        user.achievements << Achievement
            .create_by_name("500 answers", user: user) if questions == 500
        user.achievements << Achievement
            .create_by_name("1000 answers", user: user) if questions == 1000
    end
end
