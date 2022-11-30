class GymsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_gym_error

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: 200
    end

    def index 
        render json: Gym.all, status: 200
    end


    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head no_content, status: 204
    end

    def update 
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :created
    end

    private 

    def render_gym_error error
        custom = {error: "Gym not found"}
        render json: custom, status: 404
    end

    def gym_params 
        params.permit(:name, :address)
    end
end
