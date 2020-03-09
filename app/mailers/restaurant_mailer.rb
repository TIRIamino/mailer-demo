class RestaurantMailer < ApplicationMailer
  def create_confirmation
    @restaurant = params[:restaurant]

    mail(
      to:       @restaurant.user.email,
      subject:  "Restaurant #{@restaurant.name} created!"
    )
  end
end

