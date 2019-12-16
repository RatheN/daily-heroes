class PledgesController < ApplicationController
    before_action :authorize, only: [:create, :new]

    def index
        @pledges = Pledge.all
    end

    def new
        @pledge = Pledge.new
    end

    def show
        @pledge = Pledge.find_by(params[:id])
    end

    def create
        @pledge = Pledge.new(pledge_params)
        if @pledge.save
            redirect_to pledges_path
        else
            render '/pledges/new'
        end
    end

    private

    def pledge_params
        params.require(:pledge).permit(:action)
    end

end
