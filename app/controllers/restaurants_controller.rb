class RestaurantsController < ApplicationController
  def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    if @restaurant.save
      mail = RestaurantMailer.with(restaurant: @restaurant).create_confirmation
      mail.deliver_now
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end
end
