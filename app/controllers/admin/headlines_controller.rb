module Admin
  class HeadlinesController < AdminController
    before_action :set_headline, only: [:show, :update, :destroy]
  
    # GET /headlines
    def index
      @headlines = Headline.all
      render json: @headlines, include: [:news], methods: :title
    end
  
    # GET /headlines/1
    def show
      render json: @headline, include: [:news], methods: :title
    end
  
    # POST /headlines
    def create
      day = Day.find_or_create_by(date: Date.today)
      @headline = day.headlines.new(headline_params)
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
  
end