class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blog = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    # @blog = Blog.new(strong_params)
    # @blog.user_id = current_user.id
    @blog = current_user.blogs.build(strong_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "Your blog is now live."
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @blog = set_blog
  end

  def edit
    @blog = set_blog
  end

  def update
    @blog = set_blog
    if @blog.update(strong_params)
      redirect_to blogs_path, notice: "Your blog is updated."
    else
      render :edit
    end
  end

  def destroy
    @blog = set_blog.destroy
    redirect_to blogs_path, notice: "Your blog is deleted."
  end

  def confirm
    # @blog = Blog.new(strong_params)
    # @blog.user_id = current_user.id
    @blog = current_user.blogs.build(strong_params)
    render :new if @blog.invalid?
  end

  private

  def strong_params
    params.require(:blog).permit(:title, :body, )
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end


