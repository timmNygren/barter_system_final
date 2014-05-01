class Auction < ActiveRecord::Base
	mount_uploader :auctionPicture, AuctionPictureUploader
end
