class LoginController < ApplicationController
    # POST /login
    def auth
        @user = User.find_by(login_params)
        if @user
            jwt = JWT.encode({ user: @user.id }, 'secret', 'HS256')
            render json: { jwt: jwt }
        else
            render json: { error: "invalid email/password" }, status: '401'
        end
    end

    private
        def login_params
            params.require(:user).permit(:email, :password)
        end
  end
