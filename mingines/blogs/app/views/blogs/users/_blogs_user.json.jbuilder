json.extract! blogs_user, :id, :full_name, :email, :created_at, :updated_at
json.url user_url(blogs_user, format: :json)
