class UsersController < ApplicationController
    before_action :authorize, only: [:show]

    def index
    end
      
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render '/users/new'
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def show
        @user = current_user
    end

    def top_users
        @count = 0
        @users = User.top_users
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
