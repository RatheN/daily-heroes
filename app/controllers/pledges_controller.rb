class PledgesController < ApplicationController

    def index
        @pledges = Pledge.all
    end

    def new
        @pledge = Pledge.new
    end

    def show
        @pledge = Pledge.find_by_id(params[:id])
        @user = User.find_by_id(params[:user_id])
    end

    def create
        @pledge = Pledge.new(pledge_params)
        if @pledge.save
            redirect_to pledges_path(@pledge)
        else
            render '/pledges/new'
        end
    end

    def top_pledges
        @count = 0
        @pledges = Pledge.most_commitments
    end

    private

    def pledge_params
        params.require(:pledge).permit(:action, :description)
    end

end
