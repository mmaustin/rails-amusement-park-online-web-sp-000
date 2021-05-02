class RidesController < ApplicationController

    def create
        #@ride = Ride.create(ride_params)
        #binding.pry
        @ride = Ride.new(ride_params)
        @user = User.find(ride_params[:user_id])
        @attraction = Attraction.find(ride_params[:attraction_id])
        @messages = @ride.take_ride
        redirect_to user_path(@user), :flash => { :notice => @messages}
        #binding.pry
    end

    private

    def ride_params
        params.permit(:user_id, :attraction_id)
    end

end
