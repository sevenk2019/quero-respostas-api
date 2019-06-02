class AnswersController < ApplicationController
  include Wisper::Publisher
  before_action :require_login, except: [:index, :show]
  before_action :set_answer, only: [:show, :update, :destroy]

  # GET /answers
  def index
    @answers = Answer.all

    render json: @answers
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params.merge(user_id: current_user.id))

    if @answer.save
      render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      publish(:answer_questions, current_user, current_user.answers.count)
      publish(:earn_likes, @question.user, @question.user.likes)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:user_id, :question_id, :body, :likes_count, :dislikes_count)
    end
end
