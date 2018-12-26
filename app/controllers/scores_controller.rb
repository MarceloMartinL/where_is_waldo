class ScoresController < ApplicationController

	def index
		game = get_game
		@scores = game.scores.order(:time)
		@player = get_player
	end
end
