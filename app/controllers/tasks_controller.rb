class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = Tasks.all
  end

  def detail
    @tasks = Tasks.show
  end

  def new
    @tasks = Tasks.new
  end

  def create
    tasks = Tasks.new(task_params)
    tasks.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @tasks.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @tasks = Tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
