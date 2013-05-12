require 'test_helper'

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  test "should show all posts" do
    post = Post.create!(title: "Test Title", link: "rails.org", text: "Test text")
    visit posts_path

    assert page.has_content? post.title
  end

  test "should allow new post submission" do
    before_count = Post.count
    visit new_post_path
    title = 'Hello Kopitiam Post 101'
    fill_in 'Title', with: title
    fill_in 'Text', with: 'Kopi-O Jit Puay' 
    fill_in 'Link URL', with: 'http://github.com'
    click_button 'Submit'

    assert page.has_content?(title)
    assert_equal before_count + 1, Post.count
  end

  test "should not create submission if form data is not valid" do
    before_count = Post.count
    visit new_post_path
    click_button 'Submit'

    assert page.has_content?('error')
    assert_equal before_count, Post.count
  end
end
