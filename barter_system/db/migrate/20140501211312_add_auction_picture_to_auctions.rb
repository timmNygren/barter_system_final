class AddAuctionPictureToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :auction_Picture, :string
  end
end
