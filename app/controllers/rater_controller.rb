class RaterController < ApplicationController

  def create
    if logged_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

     render json: {
        average_rating: obj.average("rating").avg,
        total_rater: obj.rates("rating").count
        }, status: :ok
    else
      render json: {}, status: :ok
    end
  end
end
