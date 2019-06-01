class FeedController < ApplicationController
    before_action :set_answer, only: [:show, :update, :destroy]

    # GET /feed
    def index
      @questions = Question.order(created_at: :desc).take(20)

      render json: @questions
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
