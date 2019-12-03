# frozen_string_literal: true

class RidesController < ApplicationController
  def create
    ride = Ride.create(
      user_id: params[:user_id],
      attraction_id: params[:attraction_id]
    )
    notice = ride.take_ride

    redirect_to user_path(ride.user, notice: notice)
  end
end
