class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_error_message

    def render_error_message error
        render json: error, status: 404
    end
end
