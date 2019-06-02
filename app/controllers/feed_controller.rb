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

    # GET /feed/tag/1
    def by_tag
        @questions = Question
            .joins(:tags).where(tags: { id: params[:id] })
            .eager_load(:answers)
            .eager_load(:user)
            .order(created_at: :desc)
            .first(20)

        render_feed
    end


    # GET /feed/course/1
    def by_course
        id = params[:id]
        course = Course.find_by(id: id)
        if course
            @questions = Question
                .joins(:tags)
                .where(tags: { id: course.tags })
                .eager_load(:answers)
                .eager_load(:user)
                .order(created_at: :desc)
                .first(20)

            render_feed
        else
            render(
                json:{ error: "Could not find course with id #{id}"},
                status: 401
            )
        end
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
