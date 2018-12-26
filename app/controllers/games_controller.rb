class GamesController < ApplicationController

	def show
		@game = Game.first
		game_initializer
	end

	def search
		@game = Game.find(params[:game][:id])
		xAxis = params[:game][:xAxis]
		yAxis = params[:game][:yAxis]
		character = Character.where(':x >= x0 and :x <= x1 and :y <= y0 and :y >= y1', x: xAxis, y: yAxis).first

		update_characters_left(character) if character

		if game_finish?
			score = save_score
			render json: character
		else
			respond_to do |format|
				format.json { render json: character }
			end
		end
	end

	private

		def save_score
		 duration = Time.now - Time.parse(session[:start_time])
		 @game.scores.create(time: duration, player_id: get_player.id)
		end
end
