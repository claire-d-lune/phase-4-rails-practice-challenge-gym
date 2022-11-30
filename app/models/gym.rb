class Gym < ApplicationRecord

    dependent: destroy

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: 200
    end

    def destroy 

    end
end
