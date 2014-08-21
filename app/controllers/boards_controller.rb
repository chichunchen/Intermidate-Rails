class BoardsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	
	def index
		@boards = Board.order("created_at DESC").page(params[:page]).per(10)
	end

	def show
		@board = Board.find(params[:id])
		@comments = @board.comments.page(params[:page]).per(4)
	end

	def new
		@board = Board.new
	end

	def edit
		@board = current_user.boards.find(params[:id])
	end

	def create
		@board = current_user.boards.new(board_params)

		if @board.save
			redirect_to boards_path, :notice => "留言板新增成功"
		else
			render :new
		end 
	end

	def update
		@board = current_user.boards.find(params[:id])

		if @board.update(board_params)
			redirect_to board_path(@board), :notice => "討論版修改成功"
		else
			render :edit
		end
	end

	def destroy
		@board = current_user.boards.find(params[:id])
		@board.destroy
		redirect_to boards_path, :alert => "討論版已刪除"
	end

	private 

	def board_params
		params.require(:board).permit(:title, :description)
	end
end
