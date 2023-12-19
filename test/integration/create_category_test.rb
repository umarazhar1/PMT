require "test_helper"

class CreateBugTest < ActionDispatch::IntegrationTest
  test "get new bug form and create bug" do
    get "/bugs/new"
    assert_response :success
    assert_difference 'bug.count', 1 do
      post bugs_path, params: {bug: {name: "Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body

  end
end
