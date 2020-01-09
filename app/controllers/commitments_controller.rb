class CommitmentsController < ApplicationController
    before_action :find_pledge, only: [:show, :edit, :update]

    def new
        @pledge_id = params[:pledge_id]
        @pledge = Pledge.find_by(id: params[:pledge_id])
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

    def edit
        @pledge_id = params[:pledge_id]
        Commitment.find(params[:id]).destroy
    end

    def create
        pledge = Pledge.find(params[:pledge_id])
        @commitment = pledge.commitments.create!(commitment_params)
        redirect_to '/commitments'
    end

    def update
        @commitment.update(commitment_params)
        if @commitment.save
            redirect_to commitment_path(@commitment)
        else
            render 'commitments/edit'
        end
    end

    def destroy
        Commitment.find(params[:id]).destroy
        flash[:notice] = "Commitment was deleted."
        redirect_to commitments_path(current_user)
      end

    def user_commitments
        if logged_in?
            @commitments = current_user.commitments
        else
            redirect_to '/commitments'
        end
    end

    private

    def commitment_params
        params.permit(:user_id, :pledge_id, :frequency)
    end

    def find_pledge
        @pledge = Pledge.find_by(id: params[:pledge_id])
        @commitment = Commitment.find_by_id(params[:id])
      end
end
