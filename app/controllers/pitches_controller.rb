class PitchesController < ApplicationController
   #before_action :logged_in_user, only: [ :edit, :update, :destroy, :create, :new]
   def index
    @search = Pitch.search(params[:q])
    @search.sorts = 'rating desc'
    @pitches = @search.result.paginate(:page => params[:page], :per_page => 9)
    # @pitches = Pitch.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @pitch = Pitch.find params[:id]

    @average_rating = @pitch.average("rating") ? @pitch.average("rating").avg : 0
    @total_rater = @pitch.rates("rating") ? @pitch.rates("rating").count : 0
    @pitch.rating = @average_rating
    @pitch.save

  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = current_user.pitch.create(pitch_params)
      if @pitch.save
            flash[:success] = "pitch created"
          redirect_to root_url
      else
       render 'new'
      end
  end

  def edit
     @pitch = Pitch.find(params[:id])
  end

  def update
    @pitch = Pitch.find(params[:id])
    if @pitch.update_attributes(pitch_params)
      flash[:success] = "Thong tin Da duoc update"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy

  end

   private

    def pitch_params
      params.require(:pitch).permit(:name,:rating , :address, :quantity,:image,:description,:phone,
        :rent_shoes,:rent_kit,:rent_ball,:have_lamp,:county,:cost, :lat, :lng)
    end
end
