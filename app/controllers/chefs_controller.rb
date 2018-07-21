class ChefsController < ApplicationController
  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 10)
  end
  def new
    @chef = Chef.new
  end
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success]="Welcome {@chef.chefname} to my Recipe Application"
      redirect_to chef_path(@chef)
    else
      render :new
    end
  end
  def edit
    @chef = Chef.find(params[:id])
  end
  
  def update
    @chef = Chef.find(params[:id])
    if @chef.update(chef_params)
       flash[:success]="updated account"
      redirect_to @chef
    else
      render :edit
    end
  end
  
  def show
    @chef = Chef.find(params[:id])
    @chef_recipes = @chef.recipes.paginate(page: params[:page],per_page: 4)
  end

  def destroy
    @chef = Chef.find(params[:id])
    if @chef.destroy
      flash[:danger] = "chef deleted successfully"
      redirect_to chefs_path
    end
  end

  private
  
  def chef_params
    params.require(:chef).permit!
  end
end
