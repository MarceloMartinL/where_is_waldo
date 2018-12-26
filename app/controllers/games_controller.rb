class GamesController < ApplicationController
	protect_from_forgery except: :checkWin

	before_action :get_current_game, only: [:search, :checkWin]

	def show
		@game = Game.first
		game_initializer
	end

	def search
		xAxis = params[:game][:xAxis]
		yAxis = params[:game][:yAxis]
		character = Character.where(':x >= x0 and :x <= x1 and :y <= y0 and :y >= y1', x: xAxis, y: yAxis).first

		update_characters_left(character) if character

		respond_to do |format|
			format.json { render json: character }
		end
	end

	def checkWin
		if game_finish?
			score = save_score
			response = { win: true }
		else
			response = { win: false }
		end
		render json: response
	end

	private

		def get_current_game
			@game = Game.find(session[:game_id])
		end

		def save_score
		 duration = Time.now - Time.parse(session[:start_time])
		 @game.scores.create(time: duration, player_id: get_player.id)
		end
end
