class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        @c_u = current_user
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])
        @ride = @attraction.rides.build(user_id: session[:user_id])
        @c_u = current_user
    end

    def new
        if current_user.admin
            @attraction = Attraction.new
        else 
            redirect_to attractions_path
        end
    end

    def create
        @attraction = Attraction.create(att_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
        @attraction = Attraction.find_by_id(params[:id])
    end

    def update
        @attraction = Attraction.find_by_id(params[:id])
        @attraction.update(att_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def att_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        current_user
    end

end
