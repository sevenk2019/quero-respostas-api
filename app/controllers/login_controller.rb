class LoginController < ApplicationController
    # POST /login
    def auth
        @user = User.find_by(login_params)
        if @user
            token = Auth.new.encode(user: @user.id)
            response.set_header('Authorization', "Bearer #{token}")
            render json: { jwt: token }
        else
            render json: { error: "invalid email/password" }, status: 401
        end
    end

    private
        def login_params
            params.require(:user).permit(:email, :password)
        end
  end
