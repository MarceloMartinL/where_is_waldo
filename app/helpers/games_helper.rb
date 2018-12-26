module GamesHelper

	def game_initializer
		session[:characters] = @game.characters.map(&:name)
		session[:start_time] = Time.now
	end

	def update_characters_left(char)
		session[:characters].delete(char.name)
	end

	def game_finish?
		session[:characters].empty?
	end
end
