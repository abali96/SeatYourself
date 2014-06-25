class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path, :notice => "New restaurant created"
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(parmas[:id])

    if @restaurant.update_attribute(restaurant_params)
      redirect_to restaurant_path(@restaurant), :notice => "Updated!"
    else
      render 'edit'
    end
  end

  def destroy
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :average_price, :location, :cuisine, :max_occupancy)
  end

end
