class TeammembersController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

	def create
		@team = Team.find(params[:teammember][:team_id])
		@team.join!(current_user)
		redirect_to @team
	end

	def destroy
		@teammember = Teammember.find(params[:id])
		@team = @teammember.team
		# @team.leave!(current_user)
		@teammember.destroy
		if current_user?( @teammember.member)
			flash[:success] = "You have left team " + @team.name
		else
			flash[:success] = 'Member "' + @teammember.member.fullname + '" has been kicked out of team ' + @team.name
		end
		redirect_to @team
	end

end