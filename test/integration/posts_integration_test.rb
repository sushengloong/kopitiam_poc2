require 'test_helper'

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  test "should show all posts" do
    post = Post.create!(title: "Test Title", link: "rails.org", text: "Test text")
    visit posts_path
    assert page.has_content? post.title
  end

  test "should allow new post submission" do
    visit new_post_path
    title = 'Hello Kopitiam'
    refute page.has_content?(title)
    fill_in 'Title', with: title
    fill_in 'Text', with: 'Kopi-O Jit Puay' 
    fill_in 'Link URL', with: 'http://github.com'
    click_button 'Submit'

    assert posts_path, current_path
    assert page.has_content?(title)
  end
end
