json.array!(@stadiums) do |stadium|
  json.extract! stadium, :name, :address, :telephone, :description, :category_id
  json.url stadium_url(stadium, format: :json)
end