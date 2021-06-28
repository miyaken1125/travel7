class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @posts = Post.new(post_params)  
    if @post.save  
      redirect_to show_path
    else  
      render :new
    end
  end

  private
    def post_params 
      params.require(:user).permit(:title, :traveled, :travel_day, :travel_coment, :other_coment, :user_id)
    end  
end
