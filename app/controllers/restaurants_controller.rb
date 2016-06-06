class RestaurantsController < ApplicationController
 

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
     if @restaurant.save
      format.html { redirect_to restaurants_path, notice: 'Restaurant successfully created' }
     else
      flash[:error] = "There was a problem saving this Character"
      format.html { render :new  }
    
     end
    end

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by_id(params[:id])

    if @restaurant.update(restaurant_params)
      # redirect to show action
      redirect_to restaurant_path(@restaurant), notice: "Restaurant was updated successfully"
    else
      flash.now[:error] = "There was an issue updating"
      render :edit
    end 
  end
    
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
    redirect_to restaurants_path 
  end
private
  # any method after private will be seen as such
   def restaurant_params
    params.require(:restaurant).permit(:name, :street, :city, :country, :postal_code, :neighborhood_id, category_ids: [])
   end
   
end