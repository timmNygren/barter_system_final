json.array!(@swaps) do |swap|
  json.extract! swap, :id, :auction_id, :offer_id, :state
  json.url swap_url(swap, format: :json)
end
