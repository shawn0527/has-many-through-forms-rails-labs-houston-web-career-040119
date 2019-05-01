class PostsController < ApplicationController
  before_action :current_post, except: [:index, :new, :create]
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all 
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def current_post
    @post = Post.find(params[:id])

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
