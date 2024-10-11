class TasksController < ApplicationController
    def index
        @board = Board.find(params[:board_id])
        @tasks = Task.where(board_id: params[:board_id])
    end

    def new
        @task = current_user.tasks.build
    end
end