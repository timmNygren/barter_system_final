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

  def accept
    @swap = Swap.find_by(id: params[:id])
    @swap.state = "Accepted"
    @swap.save!
    auction = Auction.find_by(id: @swap.auction_id)
    bid = Auction.find_by(id: @swap.offer_id)
    auctioneer = User.find_by(id: @swap.owner_id)
    bidder = User.find_by(id: @swap.bidder_id)
    auction.available = false
    bid.available = false
    auction.user = bidder
    bid.user = auctioneer
    auction.save!
    bid.save!
    redirect_to index_path, notice: 'Auction accepted!'
  end

  def deny
    @swap = Swap.find_by(id: params[:id])
    @swap.state = "Denied"
    @swap.save!
    redirect_to index_path, notice: 'Auction denied'
  end

  def create_new
    @swap = Swap.new
    if current_user.auctions.empty?
      redirect_to index_path, alert: "You don't have any items to bid!"
    end
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
    @swap = Swap.new(swap_params)

    respond_to do |format|
      if @swap.save
        format.html { redirect_to index_path, notice: 'Swap was successfully created.' }
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
      params.require(:swap).permit(:auction_id, :offer_id, :state, :bidder_id, :owner_id)
    end
end
