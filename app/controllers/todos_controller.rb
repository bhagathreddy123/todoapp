class TodosController < ApplicationController
 
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
    end
    def show
    end
    def destroy
    end
    
    private 
    
    def set_todo
    end
    def todo_params
        params.require(:todo).permit!
    end
end