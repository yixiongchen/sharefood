json.array!(@mexicans) do |mexican|
  json.extract! mexican, :id
  json.url mexican_url(mexican, format: :json)
end
