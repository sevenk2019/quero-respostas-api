class FeedController < ApplicationController
    before_action :require_login, only: :from_user

    # GET /feed
    def index
        @questions = prepare_questions(Question)
        render_feed
    end

    # GET /feed/tag/1
    def by_tag
        @questions = prepare_questions(
            Question
                .joins(:tags)
                .where(tags: { id: params[:id] })
        )
        render_feed
    end


    # GET /feed/course/1
    def by_course
        id = params[:id]
        course = Course.find_by(id: id)
        if course
            @questions = prepare_questions(
                Question
                    .joins(:tags)
                    .where(tags: { id: course.tags })
            )
            render_feed
        else
            render(
                json:{ error: "Could not find course with id #{id}"},
                status: 404
            )
        end
    end

    #  GET /feed/following
    def following
        tags = current_user.tags
        @questions = prepare_questions(
            Question
                .joins(:tags)
                .where(tags: tags)
        )
    end

    private
        def prepare_questions(questions)
            questions
                .eager_load(:answers)
                .eager_load(:user)
                .eager_load(:tags)
                .order(created_at: :desc)
                .first(20)
        end

        def render_feed
            render json: @questions.to_json(
                include: [
                    :user,
                    :tags,
                    :answers => { include: :user }
                ]
            )
        end
  end
