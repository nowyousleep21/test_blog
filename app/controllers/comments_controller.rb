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
    if current_user&.id == @comment.user.id
      @comment.destroy
      redirect_to @post, notice: "Комментарий удалён!"
    else
      redirect_to @post, alert: "Нельзя удалять чужие комментарии!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def set_commentable_post
    @post = Post.find(params[:post_id])
  end

end
