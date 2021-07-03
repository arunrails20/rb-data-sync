class InwardsController < ApplicationController
  before_action :set_inward, only: [:show, :update, :destroy]

  # GET /inwards
  def index
    @inwards = Inward.order_by("created_at desc").limit(100)

    render json: @inwards
  end

  # GET /inwards/1
  def show
    render json: @inward
  end

  # POST /inwards
  def create
    @inward = Inward.new({body: request.parameters.except(:controller, :action)})

    if @inward.save
      render json: @inward, status: :created, location: @inward
    else
      render json: @inward.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inwards/1
  def update
    if @inward.update(inward_params)
      render json: @inward
    else
      render json: @inward.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inwards/1
  def destroy
    @inward.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inward
      @inward = Inward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inward_params
      params.require(:inward).permit(body: {})
    end
end
