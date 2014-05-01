class Auction < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'
	mount_uploader :auctionPicture, AuctionPictureUploader
end
