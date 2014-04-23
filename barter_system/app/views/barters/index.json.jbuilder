json.array!(@barters) do |barter|
  json.extract! barter, :id, :seller, :selling, :buyer, :offer
  json.url barter_url(barter, format: :json)
end
