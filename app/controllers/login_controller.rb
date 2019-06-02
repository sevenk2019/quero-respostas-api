class LoginController < ApplicationController
    # POST /login
    def auth
        @user = User.find_by(login_params)
        if @user
            render json: { jwt: Auth.new.encode(user: @user.id) }
        else
            render json: { error: "invalid email/password" }, status: '401'
        end
    end

    private
        def login_params
            params.require(:user).permit(:email, :password)
        end

        def jwt_token(payload)
            JWT.encode(payload, hmac_secret, 'HS256')
        end

        def hmac_secret
            ENV["AUTH_SECRET"] || '\x18\x9B\x1E\xF0R\xC6g8{\xBF\t\xFE\x81\x10\xD5y\xEBd\x8A\xF5\xF9?\xBA\xDC\x0
            E=\xFFq\xD0X\xF2\xF3'
        end
  end
