class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
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
      flash[:success] = "投稿できました"
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
    Post.find(params[:id]).destroy
    redirect_to(posts_path)
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
