class AchievementsController < ApplicationController
    before_action :require_login, only: [:index]

    # GET /achievements
    def index
        @achievements = current_user.achievements.eager_load(:achievement_type)
        render json: @achievements.to_json(
            :except => :user_id,
            :include => { :achievement_type => { :only => [:id, :name] } }
        )
    end
end
