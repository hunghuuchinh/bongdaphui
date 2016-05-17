class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  def index
     @microposts = Micropost.paginate(page: params[:page],:per_page => 10)

  end

  private

    def micropost_params
      params.require(:micropost).permit(:content,:title,:picture_micropost)
    end
end
