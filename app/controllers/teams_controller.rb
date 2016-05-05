class TeamsController < ApplicationController

 def show
   @team = Team.find params[:id]
 end

  def new
    unless current_user.team.present?
    @team = Team.new
    else
    flash[:danger] = "You can not create more than 1 Team "
    redirect_to root_url
  end
  end

  def create
    @team = current_user.build_team(team_params)
      if @team.save
            flash[:success] = "Team created"
          redirect_to root_url
      else
       render 'new'
      end
  end
  def index
    @search = Team.search(params[:q])
    @teams = @search.result.paginate(:page => params[:page], :per_page => 9)
  end

  private
  def team_params
     params.require(:team).permit(:name ,:photo,:county,:description)
  end

end

