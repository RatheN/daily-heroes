class CommitmentsController < ApplicationController

    def new
        @pledge_id = params[:pledge_id]
    end

    def index
        if params[:user_id]
            @Commitments = Commitment.where(user_id: params[:user_id])
        else
            @commitments = Commitment.all
        end
    end

    def show
        @commitment = Commitment.find_by_id(params[:id])
    end

    def create
        pledge = Pledge.find(params[:pledge_id])
        @commitment = pledge.commitments.create!(commitment_params)
        redirect_to '/commitments'
    end

    def user_commitments
        if logged_in?
            @commitments = current_user.commitments
        end
    end

    private

    def commitment_params
        params.permit(:user_id, :pledge_id, :frequency)
    end
end
