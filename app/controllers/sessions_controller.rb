class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          flash[:success] = "New user added."
          redirect_to user_path(@user)
        else
          @error = "Login failed. Please try again."
          render '/sessions/new'
        end
    end

    def destroy
        session.clear
        redirect_to user_path
    end

    
end
