class FollowedsController < ApplicationController
  before_action :set_followed, only: [:show, :update, :destroy]

  # GET /followeds
  def index
    @followeds = Followed.all

    render json: @followeds
  end

  # GET /followeds/1
  def show
    render json: @followed
  end

  # POST /followeds
  def create
    @followed = Followed.new(followed_params)

    if @followed.save
      render json: @followed, status: :created, location: @followed
    else
      render json: @followed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /followeds/1
  def update
    if @followed.update(followed_params)
      render json: @followed
    else
      render json: @followed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /followeds/1
  def destroy
    @followed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followed
      @followed = Followed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def followed_params
      params.require(:followed).permit(:userid)
    end
end
