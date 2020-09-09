class FollowingsController < ApplicationController
  before_action :set_following, only: [:destroy]

  # GET /followings
  def index
    @followings = current_user.assets

    render json: @followings
  end

  # POST /followings
  def create
    @following = current_user.followings.new(following_params)

    if @following.save
      render json: @following, status: :created, location: @following, include: :asset
    else
      render json: @following.errors, status: :unprocessable_entity
    end
  end

  # DELETE /followings/1
  def destroy
    @following.destroy
    unless @following.persisted?
      render json: @following, include: :asset
    else
      render json: @following.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_following
      @following = current_user.followings.find_by(asset_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def following_params
      params.require(:following).permit(:asset_id)
    end
end
