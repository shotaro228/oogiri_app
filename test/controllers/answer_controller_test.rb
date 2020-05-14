require 'test_helper'

class AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get answer_index_url
    assert_response :success
  end

end
