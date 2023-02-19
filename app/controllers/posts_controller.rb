class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy purge]
  before_action :compare_id, only: %i[edit update destroy]

  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc), items: 15)
  end

  def show
  end

  def new
     @post = Post.new
  end

  def edit
  end

  def purge
    @post.image.purge
    render :edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Пост создан!"
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Изменения сохранены!"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Пост удалён!"
  end

  def only_self
    @pagy, @posts = pagy(Post.where(user_id: current_user.id).order(created_at: :desc), items: 15)
    render :index
  end

  private

  def compare_id
    return if current_user&.id == @post.user.id
    redirect_to posts_path, alert: "Нельзя редактировать чужие посты!"
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
end
