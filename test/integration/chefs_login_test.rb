require 'test_helper'

class ChefsLoginTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "bhagath", email: "bhagath@example.com", password: "password")
  end
  test "invalid login is rejected" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: { email: "", password: "" }}
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  test "valid login is accepted" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: { email: @chef.email, password: @chef.password }}
    assert_redirected_to @chef
    follow_redirect!
    assert_template 'chefs/show'
  end
end
