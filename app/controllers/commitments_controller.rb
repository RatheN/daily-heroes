class CommitmentsController < ApplicationController
    before_action :authorize, only: [:create, :new, :edit, :update]
    before_action :nested?, only: [:new, :index]

    def nested?
        @pledge = Pledge.find_by_id(params[:pledge_id]) if params[:pledge_id]
    end
    
end
