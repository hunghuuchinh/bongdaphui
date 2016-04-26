class PitchesController < ApplicationController
   #before_action :logged_in_user, only: [ :edit, :update, :destroy, :create, :new]
   def index
    @search = Pitch.search(params[:q])
    @pitches = @search.result.paginate(:page => params[:page], :per_page => 30)
    # @pitches = Pitch.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @pitch = Pitch.find params[:id]
  end

  def new
    @pitch = Pitch.new
  end
  def create
    @pitch = current_user.build_pitch(pitch_params)
      if @pitch.save
            flash[:success] = "pitch created"
          redirect_to root_url
      else
       render 'new'
      end
  end
  def edit

  end

  def destroy

  end

   private

    def pitch_params
      params.require(:pitch).permit(:name,:rating , :address, :quantity,:images,:description,:phone,
        :rent_shoes,:rent_kit,:rent_ball,:have_lamp,:county,:cost, :lat, :lng)
    end
end
