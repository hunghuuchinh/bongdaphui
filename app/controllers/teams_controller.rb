class TeamsController < ApplicationController

 def show
   @team = Team.find params[:id]
 end

  def new
    @team = Team.new
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
   @teams = Team.paginate(page: params[:page])
  end

  private
  def team_params
     params.require(:team).permit(:name ,:photo,:county,:description)
  end

end

