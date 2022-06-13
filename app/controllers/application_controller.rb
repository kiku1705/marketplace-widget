class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_resource
    
    private
    def invalid_resource
        render json: {:message => 'API params are not correct'}, status: :unprocessable_entity
    end
end
