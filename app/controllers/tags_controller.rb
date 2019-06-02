class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  before_action :require_login, except: [:index, :show, :top_tags]

  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # Get /top_tags
  def top_tags
    top_tags = Tag.left_joins(:questions).group(:id).order('COUNT(tags.id) DESC').limit(10)

    render json: top_tags
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # GET /user_skills
  def user_tags
    skills = current_user.tags.select{ |tag| tag.kind == "skill" }
    
    render json: skills
  end

  # POST /user_skills
  def create_user_tag
    @tag = Tag.new(tag_params)

    if @tag.save
      current_user.tags << @tag
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :parent, :kind)
    end
end
