class BlogsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def index
    @blogs = Blog.page(params[:page]).reverse_order
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private


  def blog_params
    params.require(:blog).permit(:title, :image, :body)
  end

end
