module PlayersHelper

	def get_player
		Player.find_by(name: session[:player_name])
	end
end
