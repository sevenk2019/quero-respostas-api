class UsersController < ApplicationController
  before_action :require_login, except: [:index, :create, :top_users]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /top_users
  def top_users
    @users = User.order(points: :desc).take(10)
    render json: @users
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      token = Auth.new.encode(user: @user.id)
      response.set_header('Authorization', "Bearer #{token}")
      render json: { jwt: token }
    else
      render json: { error: "invalid params" }, status: 401
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(
        :name, :email, :password, :university, :quero_bolsa_user
      )
    end
end
