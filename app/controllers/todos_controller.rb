class TodosController < ApplicationController
 before_action :set_todo, only: [:edit,:update,:show,:destroy]
   def index
       @todos = Todo.all
   end
    def new
        @todo = Todo.new
    end
    def create
        @todo = Todo.new(todo_params)
        if @todo.save
           flash[:notice] = "Todo successfully created"
            redirect_to todos_path
        else
            render :new
        end
    end
    def edit
    end
    def update
        if @todo.update(todo_params)
            flash[:notice] = "edited todo successfully"
            redirect_to todos_path
        else
            render :edit
        end
    end
    def show
    end
    def destroy
        if @todo.destroy
            flash[:notice] = "todo deleted successfully"
            redirect_to todos_path
        end
    end
    
    private 
    
    def set_todo
         @todo = Todo.find(params[:id])
    end
    def todo_params
        params.require(:todo).permit!
    end
end