require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  before do
    sign_in(user)
  end

  let(:user) {User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")}
  let(:test_post) {Post.create(title: "test-title", content: "test-content", user_id: user.id)}

  describe "index action" do
    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "show action" do
    it "render show template" do
      get :show, params: {id: test_post.id}
      expect(response).to render_template(:show)
    end
  end

  describe "create action" do
    it "redirects to created post" do
      post :create, params: {post: {title: "test-title", content: "test-content", user_id: user.id}}
      expect(response).to redirect_to post_path(assigns(:post))
    end

    it "renders new template if validation fail" do
      post :create, params: {post: {content: "test-content", user_id: user.id}}
      expect(response).to render_template(:new)
    end
  end

  describe "new action" do
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "update action", :type => :request do
    it "redirects to updated post" do
      patch "/posts/#{test_post.id}", params: {post: {title: "test-title", content: "test-content", user_id: user.id}}
      expect(response).to redirect_to post_path(test_post)
    end

    it "renders edit template if validation fail" do
      patch "/posts/#{test_post.id}", params: {post: {title: nil, content: "test-content", user_id: test_post.id}}
      expect(response).to render_template(:edit)
    end
  end

  describe "destroy action" do
    it "redirects after destroy" do
    delete :destroy, params: {id: test_post.id}
    expect(response).to redirect_to posts_path
    end
  end
end
