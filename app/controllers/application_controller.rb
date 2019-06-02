class ApplicationController < ActionController::API
    def current_user
        if http_authorization?
            decoded_id = Auth.new.decode(token)['user']
            @current_user ||= User.find(decoded_id)
        end
    end

    def logged_id?
        current_user.present?
    end

    def require_login
        render json: { error: 'unauthorized' }, status: 401 unless logged_id?
    end

    def token
        request
            .env['HTTP_AUTHORIZATION']
            .scan(/Bearer (.*)$/)
            .flatten
            .last
    end

    def http_authorization?
        request
            .env
            .fetch('HTTP_AUTHORIZATION', '')
            .scan(/Bearer/)
            .flatten
            .first
            .present?
    end
end
