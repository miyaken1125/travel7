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
    @post = Post.new(post_params)  
    if @post.save  
      # 他のURLに転送（リダイレクト）するには、redirect_toメソッドを用いま
      redirect_to show_path(@post.id)
    else  
      render :new
    end
  end

  private
    def post_params 
      params.require(:post).permit(:title, :traveled, :travel_day, :travel_coment, :other_coment)
    end  
end
