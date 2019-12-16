class PledgesController < ApplicationController
    before_action :authorize, only: [:create, :new]

    def new
        @pledge = Pledge.new
    end

    
end
