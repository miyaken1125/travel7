class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

    if postal_code = params[:postal_code]
      params = URI.encode_www_form({zipcode: postal_code})
      uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
      response = Net::HTTP.get_response(uri)
      result = JSON.parse(response.body)
    
      if result["results"]
        @zipcode = result["results"][0]["zipcode"]
        @address1 = result["results"][0]["address1"]
        @address2 = result["results"][0]["address2"]
        @address3 = result["results"][0]["address3"]
      end
    end
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
