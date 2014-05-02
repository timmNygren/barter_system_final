class SwapsController < ApplicationController
  before_action :set_swap, only: [:show, :edit, :update, :destroy]

  # GET /swaps
  # GET /swaps.json
  def index
    @swaps = Swap.all
  end

  # GET /open_user_swaps
  def open_for_user
    @swaps = Swap.where(owner_id: current_user.id, state: "Open")
  end

  # GET /swaps/1
  # GET /swaps/1.json
  def show
  end

  # GET /swaps/new
  def new
    @swap = Swap.new
  end

  # GET /swaps/1/edit
  def edit
  end

  # POST /swaps
  # POST /swaps.json
  def create
    @auction = Auction.find_by(id: @swap.auction_id)
    @owner = User.find_by(id: @auction.user.id)
    @swap = Swap.new(swap_params, owner_id: @owner.id)

    respond_to do |format|
      if @swap.save
        format.html { redirect_to @swap, notice: 'Swap was successfully created.' }
        format.json { render :show, status: :created, location: @swap }
      else
        format.html { render :new }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swaps/1
  # PATCH/PUT /swaps/1.json
  def update
    respond_to do |format|
      if @swap.update(swap_params)
        format.html { redirect_to @swap, notice: 'Swap was successfully updated.' }
        format.json { render :show, status: :ok, location: @swap }
      else
        format.html { render :edit }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swaps/1
  # DELETE /swaps/1.json
  def destroy
    @swap.destroy
    respond_to do |format|
      format.html { redirect_to swaps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swap
      @swap = Swap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swap_params
      params.require(:swap).permit(:auction_id, :offer_id, :state)
    end
end
