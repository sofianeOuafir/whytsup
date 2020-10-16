class HeadlinesController < ApplicationController
  before_action :set_headline, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:index, :show]

  # GET /headlines
  def index
    if current_user.present?
      @headlines = current_user.headlines.joins(:day).order("days.date DESC") + Headline.where.not(id: current_user.headlines.map(&:id)).joins(:day).order("days.date DESC")
    else
      @headlines = Headline.all.joins(:day).order("days.date DESC")
    end
    

    render json: @headlines, include: [news: { include: :author }], methods: :title
  end

  # GET /headlines/1
  def show
    render json: @headline, include: [news: { include: :author }], methods: :title
  end

  # POST /headlines
  def create
    @headline = Headline.new(headline_params)

    if @headline.save
      render json: @headline, status: :created, location: @headline
    else
      render json: @headline.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /headlines/1
  def update
    if @headline.update(headline_params)
      render json: @headline
    else
      render json: @headline.errors, status: :unprocessable_entity
    end
  end

  # DELETE /headlines/1
  def destroy
    @headline.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headline
      @headline = Headline.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def headline_params
      params.require(:headline).permit(:asset_id, :day_id)
    end
end
