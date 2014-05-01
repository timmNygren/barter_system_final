class Auction < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'
	mount_uploader :image, AuctionPictureUploader
	validates :auction_name, :auction_description, :image, presence: true
	belongs_to :user
end
