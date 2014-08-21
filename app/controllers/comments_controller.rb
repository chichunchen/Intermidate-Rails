class CommentsController < ApplicationController
	before_action :find_board
	before_action :authenticate_user!

	def new
		@comment = @board.comments.new
	end

	def create
    	@comment = @board.comments.new(comment_params)
    	@comment.author = current_user

		if @comment.save
			redirect_to board_path(@board), :notice => "留言成功"
		else
			render :new
		end 
	end

	def edit
    	@comment = @board.comments.find(params[:id])
	end

	def update
    	@comment = @board.comments.find(params[:id])

		if @comment.update(comment_params)
			redirect_to board_path(@board), :notice => "修改成功"
		else
			render :edit
		end
	end

	def destroy
		@comment = @board.comments.find(params[:id])

		@comment.destroy
		redirect_to board_path(@board), :notice => "已刪除留言"
	end

	private 

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_board
		@board = Board.find(params[:board_id])
	end
end
