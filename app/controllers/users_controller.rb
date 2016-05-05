class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  #before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,  only: :destroy

  def index
      @search = User.search(params[:q])
      @users = @search.result.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Chao Mung den voi Bong Da Phui!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Thong tin Da duoc update"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] ="Xoa Thanh Cong"
    redirect_to users_url
  end

   private

    def user_params
      params.require(:user).permit(:role ,:name, :email,:phone,:picture, :password,
                                   :password_confirmation)
    end

     # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

     # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless (current_user.role =="admin")
    end
end
