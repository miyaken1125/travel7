class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end
 
  def create
    @comment = @current_user.comments.build(comment_params)
    if @comment.save  
      # 他のURLに転送（リダイレクト）するには、redirect_toメソッドを用いま
      redirect_to comment_show_path(@comment.id)
    else  
      render :new
    end
  end

  private
    def comment_params 
      params.require(:comment).permit(:comment, :user_id, :post_id)
    end  
end


