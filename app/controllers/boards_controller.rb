class BoardsController < ApplicationController
	before_action :authenticate_user! 
	
	def index
		@boards = Board.all
	end

	def show
		@board = Board.find(params[:id])
	end

	def new
		@board = Board.new
	end

	def edit
		@board = current_user.boards.find(params[:id])
	end

	def create
		current_user.boards.create(board_params)
		redirect_to boards_path
	end

	def update
		@board = current_user.boards.find(params[:id])
		@board.update!(board_params)
		redirect_to boards_path
	end

	def destroy
		@board = current_user.boards.find(params[:id])
		@board.destroy
		redirect_to boards_path
	end

	private 

	def board_params
		params.require(:board).permit(:title, :description)
	end
end
