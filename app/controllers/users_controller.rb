class UsersController < ApplicationController
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
       flash[:notice] = "権限がありません"
       redirect_to("/posts/index")
    end
  end   


  
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end
  
  def login_form
    
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to post_index_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render :login_form
    end
  end

  def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/login")   
  
  end
  
  
  
   


  # データベースに保存する仕組みを書く。
  def create
    @user = User.new(user_params)  
    if @user.save  
      session[:user_id] = @user.id
      redirect_to show_path(@user.id)
    else  
      render :new
    end
  end

  private
    def user_params 
      params.require(:user).permit(:user_name, :nick_name, :birthday, :user_adress, :email, :password, 
        :password_confirmation, :user_gender ,:image_name)
    end  
    # "default_user.jpg"
end
