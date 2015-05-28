json.array!(@users) do |user|
  json.extract! user, :email, :name, :password, :password_confirmation
  json.url user_url(user, format: :json)
end