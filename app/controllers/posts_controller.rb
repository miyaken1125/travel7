class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
  end
 
  def create
    p "=================="
    p params
    p @current_user
    p "=================="
    # @post = Post.new(post_params)  
    @post = @current_user.posts.build(post_params)
    if @post.save  
      # 他のURLに転送（リダイレクト）するには、redirect_toメソッドを用いま
      redirect_to post_show_path(@post.id)
    else  
      p "======================"
      p @post.errors.full_messages
      p "======================"
      render :new
    end
  end

  private
    def post_params 
      params.require(:post).permit(:title, :traveled, :travel_day, :travel_coment, :other_coment)
    end  
end
