class Auction < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'
	mount_uploader :image, AuctionPictureUploader
end
