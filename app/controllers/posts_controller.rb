class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_category, only: %i[index new create]

  def index
    @posts = Post.all.with_rich_text_desc
  end

  def show; end

  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.category_id = params[:category_id]
    if @post.save
      redirect_to user_category_posts_path, notice: 'post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to user_category_posts_path, notice: 'post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_category_posts_path, notice: 'post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_category
    @category = params[:category_id]
  end

  def post_params
    params.require(:post).permit(:title, :desc)
  end
end
