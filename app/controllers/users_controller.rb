class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end


  # データベースに保存する仕組みを書く。
  def create
    @user = User.new(user_params)  
    if @user.save  
      redirect_to show_path
    else  
      render :new
    end
  end

  private
    def user_params 
      params.require(:user).permit(:user_name, :nick_name, :birthday, :user_adress, :email, :password, :password_confirmation, :user_gender)
    end  

end
