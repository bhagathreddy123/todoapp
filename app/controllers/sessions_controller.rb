class SessionsController < ApplicationController
    def new
    end
    def create
        chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
            session[:chef_id] = chef.id
            flash[:success] = "you have successfully logged in"
            redirect_to chef
        else
            flash.now[:danger] = "there was something wrong your login information"
            render :new
        end
    end
    def destroy
        params[:chef_id] = nil
        flash[:success] = "You logout successfully"
        redirect_to root_path
    end
end