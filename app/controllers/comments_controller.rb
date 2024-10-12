class CommentsController < ApplicationController
    before_action :set_board_and_task,only:[:new,:create]

    def new
        @comment = @task.comments.build
    end

    def create
        @comment = @task.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to board_task_path(@board,@task),notice: 'コメントを追加できました'
        else
            flash.now[:error] = 'コメント追加に失敗しました'
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_board_and_task
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:task_id])
    end
end