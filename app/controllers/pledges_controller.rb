class PledgesController < ApplicationController
    before_action :authorize, only: [:create, :new]

    def new
        @pledge = Pledge.new
    end

    def show
        @pledge = Pledge.find_by(params[:id])
    end
    
end
