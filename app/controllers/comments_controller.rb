class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable_post

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: "Комментарий сохранён!"
    else
      render "posts/show"
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post, notice: "Комментарий удалён!"
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def set_commentable_post
    @post = Post.find(params[:post_id])
  end

end
