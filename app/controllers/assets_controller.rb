class AssetsController < ApplicationController
  skip_before_action :authenticate_request, only: :index

  # GET /assets
  def index
    @assets = if current_user.present?
      Asset.all.where.not(id: current_user.assets.map(&:id))
    else
      Asset.all
    end

    render json: @assets
  end
end
