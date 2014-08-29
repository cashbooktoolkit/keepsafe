json.array!(@storeditems) do |storeditem|
  json.extract! storeditem, :id, :name, :user_id
  json.url storeditem_url(storeditem, format: :json)
end
