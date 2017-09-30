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
    @todo.save
    redirect_to todos_url
  end

  def show
  end

  def edit
  end

  def destroy
    @todo.destroy
    redirect_to todos_url
  end

  def update
    
    @todo.update_attributes(todo_params)
    redirect_to todo_path(@todo)
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
