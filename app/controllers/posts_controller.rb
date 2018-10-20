class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @posts = Post.paginate(page: params[:page], per_page: 20)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to(posts_path)
    else
      render 'static_pages/home'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to(posts_path)
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to(posts_path)
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to(root_url) if @post.nil?
    end
end
