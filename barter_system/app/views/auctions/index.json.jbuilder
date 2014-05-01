json.array!(@auctions) do |auction|
  json.extract! auction, :id, :auction_name, :auction_description, :user_id, :available
  json.url auction_url(auction, format: :json)
end
