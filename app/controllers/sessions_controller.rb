class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
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
        redirect_to root_path
    end

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to pledges_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
