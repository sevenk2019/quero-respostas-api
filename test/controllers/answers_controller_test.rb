require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get answers_url, as: :json
    assert_response :success
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post answers_url, params: { answer: { body: @answer.body, dislikes_count: @answer.dislikes_count, likes_count: @answer.likes_count, question_id: @answer.question_id, user_id: @answer.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show answer" do
    get answer_url(@answer), as: :json
    assert_response :success
  end

  test "should update answer" do
    patch answer_url(@answer), params: { answer: { body: @answer.body, dislikes_count: @answer.dislikes_count, likes_count: @answer.likes_count, question_id: @answer.question_id, user_id: @answer.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete answer_url(@answer), as: :json
    end

    assert_response 204
  end
end
