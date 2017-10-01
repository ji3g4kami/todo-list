class TodosController < ApplicationController
  before_action :set_todo, :only => [:show, :edit, :update, :destroy]
  
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:success] = "Task was successfully created"
      redirect_to todos_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @todo[:due_date] < DateTime.now.to_date
      flash[:danger] = "You cannot delete out dated tasks"
      redirect_to todos_url
    else
      flash[:success] = "Task was successfully deleted"
      @todo.destroy
      redirect_to todos_url
    end
  end

  def update
    flash[:success] = "Task was successfully updated"
    if @todo.update_attributes(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
