class GamesController < ApplicationController

	def index
		@game = Game.first
	end

	def search
		xAxis = params[:game][:xAxis]
		yAxis = params[:game][:yAxis]
		character = Character.where(':x >= x0 and :x <= x1 and :y <= y0 and :y >= y1', x: xAxis, y: yAxis).first

		respond_to do |format|
			format.json { render json: character }
		end
	end
end
