module GamesHelper

	def game_initializer
		session[:game_id] = @game.id
		session[:characters] = @game.characters.map(&:name)
		session[:start_time] = Time.now
	end

	def get_game
		Game.find(session[:game_id])
	end

	def update_characters_left(char)
		session[:characters].delete(char.name)
	end

	def game_finish?
		session[:characters].empty?
	end
end
