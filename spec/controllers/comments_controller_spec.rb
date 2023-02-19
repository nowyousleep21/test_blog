require 'rails_helper'

RSpec.describe CommentsController, :type => :request do
  before do
    sign_in(user)
  end
  let(:user) {User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")}
  let(:test_post) {Post.create(title: "test-title", content: "test-content", user_id: user.id)}
  let(:comment) {Comment.create(body: "test-comment", user_id: user.id, post_id: test_post.id)}

  describe "create action" do
    it "redirects to post of created comment" do
      post "/posts/#{test_post.id}/comments", params: {comment: {body: "test-title", post_id: test_post.id, user_id: user.id}}
      expect(response).to redirect_to post_path(assigns(:post))
    end

    it "renders new template if validation fail" do
      post "/posts/#{test_post.id}/comments", params: {comment: {body: nil, post_id: test_post.id, user_id: user.id}}
      expect(response).to render_template(:show)
    end
  end

  describe "destroy action" do
    it "redirects to posts" do
      delete "/posts/#{test_post.id}/comments/#{comment.id}", params: {id: comment.id}
      expect(response).to redirect_to post_path(comment.post)
    end
  end
end
