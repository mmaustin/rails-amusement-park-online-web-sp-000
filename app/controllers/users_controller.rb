class UsersController < ApplicationController

    def signin
        @users = User.all
    end

    def sign
        user = User.find_by_name(params[:user_name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render :signin
        end
    end

    def show
        if !logged_in?
            redirect_to '/'
        else
            @user = User.find_by_id(params[:id])
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private

    def user_params
      params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        current_user
    end

end
