class TasksController < ApplicationController
    def index
        @board = Board.find(params[:board_id])
        @tasks = Task.where(board_id: params[:board_id])
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @board = Board.find(params[:board_id])
        @task = @board.tasks.build
    end

    def create
        @board = Board.find(params[:board_id])
        @task = @board.tasks.build(task_params)
        @task.user = current_user

        if @task.save
            redirect_to board_tasks_path(@board),notice: 'タスクを追加しました'
        else
            flash.now[:error] = 'タスクを保存できませんでした'
            render :new
        end
    end

    def edit
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @task = current_user.tasks.find(params[:id])

        if @task.update(task_params)
            redirect_to board_tasks_path(params[:board_id]),notice: '保存できました'
        else
            flash.now[:error] = '保存できませんでした'
            render :edit
        end
    end

    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to board_tasks_path(params[:board_id]),notice: '削除できました'
    end

    private
    def task_params
        params.require(:task).permit(:eyecatch,:title,:content,:due_date)
    end
end