json.array!(@pictures) do |picture|
  json.extract! picture, :id, :table_id, :theme, :url, :name
  json.url picture_url(picture, format: :json)
end
