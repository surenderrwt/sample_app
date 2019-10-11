require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should get create" do
    get login_path , params: {session: { email: @user.email, password: "password"}}
    assert_response :success
  end

  test "should get destroy" do
    delete logout_path
    follow_redirect!
    assert_response :success
  end

end
