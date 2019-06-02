class QuestionsController < ApplicationController
  include Wisper::Publisher
  before_action :require_login, except: [:index, :show]
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params.except(:tags).merge(user_id: current_user.id))

    if @question.save
      tags = []


      question_params["tags"].each do |tag|
        t = Tag.where(name: tag).last

        unless t
          t = Tag.create!(
            name: tag,
            kind: "subject",
            parent: tag
          )
        end

        tags << t
      end

      @question.tags = tags
      render json: @question.to_json(
        include: [
            :user,
            :tags,
            :answers => { include: :user }
        ]
    ), status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      publish(:make_questions, current_user, current_user.questions.count)
      publish(:earn_likes, @question.user, @question.user.likes)
      # render json: @question
      render json: @question.to_json(
          include: [
              :user,
              :tags,
              :answers => { include: :user }
          ]
      )
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:user_id, :body, :title, :likes_count, :dislikes_count, :timestamps, tags: [])
    end
end
