require 'test_helper'

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  test "should show all posts" do
    post = Post.create!(title: "Test Title", link: "rails.org", text: "Test text")
    visit posts_path
    assert page.has_content? post.title
  end
end
