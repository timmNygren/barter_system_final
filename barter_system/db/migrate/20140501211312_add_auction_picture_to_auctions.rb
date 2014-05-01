class AddAuctionPictureToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :image, :string
  end
end
