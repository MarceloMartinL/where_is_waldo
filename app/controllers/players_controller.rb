class PlayersController < ApplicationController

	def new
		@player = Player.new
	end

	def create
		player = Player.find_or_create_by(name: get_name)

		if player
			session[:player_name] = player.name
			flash[:notice] = "You are playing as #{player.name}"
			redirect_to Game.first
		else
			render 'new'
		end
	end

	private

		def get_name
			name = params[:player][:name]
			name.blank? ? Player.guest_name : name
		end
end
