class TeamsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    @teams = Team.paginate(page: params[:page], per_page: 10)
  end

  def new    
    @team = current_user.teams.build if signed_in?
  end

  def create
    @team = current_user.teams.build(team_params)
    @team.creator_id = current_user.id
    if @team.save
      @team.join!(current_user)
      flash[:success] = "Team build successfully !"
      redirect_to @team
    else
      render 'new'
    end
  end

  def show
    @team = Team.find(params[:id])
    @teammembers = @team.teammembers.paginate(page: params[:page], per_page: 10)
  end

  def destroy
  end

  def team_params
    params.require(:team).permit(:name)
  end

end