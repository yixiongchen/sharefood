json.array!(@canadianposts) do |canadianpost|
  json.extract! canadianpost, :id, :content, :user_id, :status, :location, :foodtype, :picture, :list_of_user_id
  json.url canadianpost_url(canadianpost, format: :json)
end
