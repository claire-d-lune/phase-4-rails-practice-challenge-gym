class MembershipsController < ApplicationController

    def create
        Membership.create!(member_params)
    end

    private

    def member_params
        params.permit(:client_id, :gym_id, :charge)
    end

   
end
