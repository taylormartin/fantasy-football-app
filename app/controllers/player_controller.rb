class PlayerController < ApplicationController

  # before_action :authenticate_user!
  def create
    @player = current_team.players.new player_create_params
    if @player.save
      render :show
    else
      render_invalid @player
    end
  end

private

  def player_create_params
    params.require(:player).permit(:name, :pos, :nfl_team)
  end

  def current_team
    current_user.teams.find_by_name(params[:team])
  end

end