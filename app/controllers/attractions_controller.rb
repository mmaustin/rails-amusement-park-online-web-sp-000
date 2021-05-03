class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])
        @ride = @attraction.rides.build(user_id: session[:user_id])
        @user = @attraction.users.build(user_id: session[:user_id])
    end

end
