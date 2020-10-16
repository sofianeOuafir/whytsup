module Admin
  class PricesController < AdminController
    before_action :set_price, only: [:show, :update, :destroy]

    # GET /prices
    def index
      @prices = Price.all

      render json: @prices
    end

    # GET /prices/1
    def show
      render json: @price
    end

    # POST /prices
    def create
      day = Day.find_or_create_by(date: Date.today)
      @price = day.prices.new(price_params)

      if @price.save
        render json: @price, status: :created
      else
        render json: @price.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /prices/1
    def update
      if @price.update(price_params)
        render json: @price
      else
        render json: @price.errors, status: :unprocessable_entity
      end
    end

    # DELETE /prices/1
    def destroy
      @price.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_price
        @price = Price.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def price_params
        params.require(:price).permit(:value, :change, :date_id, :asset_id)
      end
  end
end
