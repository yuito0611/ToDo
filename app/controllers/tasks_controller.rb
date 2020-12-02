class TasksController < ApplicationController
  before_action :set_categories_list, only: [:new, :create, :edit, :update]

  private def set_categories_list
    @categories_list = []
    @categories = Category.all

    # リストボックスに値を追加
    @categories.each do |category|
      if category.id != 1
        tmp = [category.name,category.id]
        @categories_list << tmp
      end
    end
  end

  #タスク一覧
  def index
    if params[:category_id] == nil
      @tasks = Task.all
      @category = Category.new(id:0, name:"すべて")
    else
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks
    end
    
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end



  def create
    task_params = params.require(:task).permit(:name,:priority,:date).merge(category_id: params[:category_id],done: false)
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path(category_id: @task.category_id)
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.assign_attributes(params[:task])
    if @task.save
      redirect_to tasks_path(category_id: @task.category_id)
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @category_id = @task.category_id
    @task.destroy
    redirect_to tasks_path(category_id: @category_id), notice:"タスクを削除しました。"
  end


end
