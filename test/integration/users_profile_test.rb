require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sato)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.posts.count.to_s, response.body
    @user.posts.paginate(page: 1).each do |post|
      assert_match post.content, response.body
    end
  end
end
