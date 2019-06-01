class FeedController < ApplicationController
    # GET /feed
    def index
        @questions = Question
            .eager_load(:answers)
            .eager_load(:user)
            .order(created_at: :desc)
            .first(20)

        render_feed
    end

    # GET /tag/1
    def by_tag
        @questions = Question
            .joins(:tags).where(tags: { id: params[:tag] })
            .eager_load(:answers)
            .eager_load(:user)
            .order(created_at: :desc)
            .first(20)

        render_feed
    end

    private
        def render_feed
            render json: @questions.to_json(
                include: [
                    :user,
                    :answers => { include: :user }
                ]
            )
        end
  end
