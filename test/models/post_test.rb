require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:sato)
    @post = @user.posts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "  "
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end

  test "title should not too be long" do
    @post.title = "a" * 21
    assert_not @post.valid?
  end
end
