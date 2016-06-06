class TeamsController < ApplicationController

 def show
   @team = Team.find params[:id]
 end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.create(team_params)
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
    if @teams.count == 0
        flash[:danger] = "no suitable for your search"
    end
  end

  private
  def team_params
     params.require(:team).permit(:name ,:photo,:county,:description)
  end

end

