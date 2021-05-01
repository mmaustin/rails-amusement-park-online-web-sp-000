class UsersController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

    private

    def user_params
      params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end

end
